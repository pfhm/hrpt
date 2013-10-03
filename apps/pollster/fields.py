from django.db import connection
from django.core import exceptions, validators
from django.forms import CharField, ValidationError
from django.utils.translation import ugettext_lazy as _
from .db.utils import get_db_type, convert_query_paramstyle
import datetime, time, re, logging
from django.conf import settings

YEARMONTH_INPUT_FORMATS = (
    '%Y-%m', '%m/%Y', '%m/%y', # '2006-10', '10/2006', '10/06'
)

DATE_INPUT_FORMATS = (
    '%Y-%m-%d', '%d-%m-%Y', '%d/%m/%Y', '%d/%m/%y', '%d-%m-%y'
)

POSTALCODE_INPUT_FORMATS = {
    'it': r'\d{5}', # e.g. 10100
    'uk': r'(GIR)|(((A[BL]|B[ABDHLNRSTX]?|C[ABFHMORTVW]|D[ADEGHLNTY]|E[HNX]?|F[KY]|G[LUY]?|H[ADGPRSUX]|I[GMPV]|JE|K[ATWY]|L[ADELNSU]?|M[EKL]?|N[EGNPRW]?|O[LX]|P[AEHLOR]|R[GHM]|S[AEGKLMNOPRSTY]?|T[ADFNQRSW]|UB|W[ADFNRSV]|YO|ZE)[1-9]?[0-9]|((E|N|NW|SE|SW|W)1|EC[1-4]|WC[12])[A-HJKMNPR-Y]|(SW|W)([2-9]|[1-9][0-9])|EC[1-9][0-9]))', #
    'nl': r'\d{4}',
    'be': r'\d{4}',
    'de': r'\d{5}',
    'pt': r'\d{4}',
    'at': r'\d{4}',
    'ch': r'\d{4}',
    'se': r'\d{5}',
    'fr': r'\d{5}',
}

logger = logging.getLogger(__name__)

class YearMonthField(CharField):
    default_error_messages = {
        'invalid': _('Enter a valid year and month.'),
    }

    def __init__(self, input_formats=None, *args, **kwargs):
        super(YearMonthField, self).__init__(*args, **kwargs)
        self.input_formats = input_formats

    def clean(self, value):
        """
        Validate month and year values.
        
        Returns a string object in YYYY-MM format.
        """
        if value in validators.EMPTY_VALUES:
            return None
        if isinstance(value, datetime.datetime):
            return format(value, '%Y-%m')
        if isinstance(value, datetime.date):
            return format(value, '%Y-%m')
        for fmt in self.input_formats or YEARMONTH_INPUT_FORMATS:
            try:
                date = datetime.date(*time.strptime(value, fmt)[:3])
                return format(date, '%Y-%m')
            except ValueError:
                continue
        raise ValidationError(self.error_messages['invalid'])

class DateField(CharField):
    default_error_messages = {
        'invalid': _('Enter a valid date.'),
    }

    def __init__(self, input_formats=None, *args, **kwargs):
        super(DateField, self).__init__(*args, **kwargs)
        self.input_formats = input_formats

    def clean(self, value):
        """
        Validate month and year values.
        
        Returns a string object in YYYY-MM-DD format.
        """
        if value in validators.EMPTY_VALUES:
            return None
        if isinstance(value, datetime.datetime):
            return format(value, '%Y-%m-%d')
        if isinstance(value, datetime.date):
            return format(value, '%Y-%m-%d')
        for fmt in self.input_formats or DATE_INPUT_FORMATS:
            try:
                date = datetime.date(*time.strptime(value, fmt)[:3])
                return format(date, '%Y-%m-%d')
            except ValueError:
                continue
        raise ValidationError(self.error_messages['invalid'])

class PostalCodeField(CharField):
    default_error_messages = {
        'invalid': _('Enter a valid postal code.'),
    }

    @staticmethod
    def get_default_postal_code_format():
        return POSTALCODE_INPUT_FORMATS.get(settings.COUNTRY);

    def __init__(self, input_format=None, *args, **kwargs):
        super(PostalCodeField, self).__init__(*args, **kwargs)
        self.input_format = input_format

    def clean(self, value):
        """
        Validate postal codes.
        """
        if value in validators.EMPTY_VALUES:
            return None
        fmt = self.input_format or PostalCodeField.get_default_postal_code_format()
        if fmt and not re.match('^'+fmt+'$', value, flags=re.IGNORECASE):
            raise ValidationError(self.error_messages['invalid'])
        if not self.db_check_zip(value):
            raise ValidationError(self.error_messages['invalid'])
        return value

    def db_check_zip(self, value):
        if not hasattr(settings, 'POLLSTER_ZIP_CODE_DB_VALIDATION_MODE'):
            return True
        mode = settings.POLLSTER_ZIP_CODE_DB_VALIDATION_MODE
        if not mode or mode == 'NONE':
            return True
        if mode == 'EXACT':
            params = { 'country': settings.COUNTRY.lower(), 'zip': str(value).lower() }
            query = "SELECT count(*) FROM pollster_zip_codes WHERE lower(country) = %(country)s AND lower(zip_code_key) = %(zip)s"
            query = convert_query_paramstyle(connection, query, params)
            cursor = connection.cursor()
            cursor.execute(query, params)
            count = cursor.fetchone()[0]
            return count > 0
        return False
