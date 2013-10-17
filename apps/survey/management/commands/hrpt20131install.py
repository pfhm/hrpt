DB_NAME="dbname"
DB_USER="dbuser"
DB_PASSWORD="dbpassword"
DB_HOST="dbhost"

ERR_MSG = "error: usage hrpt_scripts.py [-options] where options is: import_scb_data <path to filename> and/or deactivate_survey_user and/or create_id_code_table. "
ERR_MSG += "Note that create_id_code_table is a requirement for import_scb_data"
con = None

from django.core.management.base import BaseCommand, CommandError
import sys,traceback
import datetime
import psycopg2
from apps.survey.models import SurveyIdCode 
from django.contrib.auth.models import User


class Command(BaseCommand):
    args = ''
    help = 'Imports data from scb and deactivates current users'

    def handle(self, *args, **options):
        #print args
        go(args)

def go(args):
    #cmdList = sys.argv
    cmdList = args
    #print args
    
    if "deactivate_survey_user" not in cmdList and "import_scb_data" not in cmdList and "create_id_code_table" not in cmdList:
        print ERR_MSG
        
    if("deactivate_survey_user" in cmdList):
        deactivate_survey_user()
    
    if("drop" in cmdList):
        drop_id_code_table()
    
    if("create_id_code_table" in cmdList):
        create_id_code_table()
    
    try:    
        if("import_scb_data" in cmdList):
            pos1 = cmdList.index("import_scb_data")
            import_scb_data(cmdList[pos1 + 1])
    except:
        print ERR_MSG
        traceback.print_exc(file=sys.stdout)
        #raise ValueError()
        
    if con:
        print "Close con"
        con.close()
           
def connectionTest():
    cur = con.cursor()
    cur.execute('SELECT version()')          
    ver = cur.fetchone()
    print ver
    
def connectToDb():
    if(con != None):
        #print "Already connected!"
        return

try: 
    con = psycopg2.connect(
    database = DB_NAME,
    user = DB_USER,
    password = DB_PASSWORD,
    host = DB_HOST
)
    con.autocommit= False

except psycopg2.DatabaseError, e:
    print 'Error %s' % e    
    sys.exit(1)

def drop_id_code_table():
    cur = con.cursor()
    cur.execute('DROP TABLE survey_surveyidcode') 
    con.commit()

def create_id_code_table():
    sql="CREATE TABLE survey_surveyidcode (id serial NOT NULL PRIMARY KEY,surveyuser_global_id varchar(36) UNIQUE,idcode varchar(10) NOT NULL UNIQUE,fodelsedatum varchar(10));"
    cur = con.cursor()
    cur.execute(sql) 
    con.commit()

def import_scb_data(f):
    print "import scb data from " + f
    importfile = open(f, 'r')
    print importfile
    
    for line in importfile:
        print "importing",line
        vals = line.split(',')
        if len(vals) == 2:
            idcode = SurveyIdCode(idcode=vals[0].strip(),fodelsedatum=vals[1].strip())
        else:
            idcode = SurveyIdCode(idcode=vals[0].strip())
        idcode.save()
        
def deactivate_survey_user():
    print "deactivate survey users"
    users = User.objects.all()
    
    for user in users:
        if not user.is_staff and user.is_active == True:
            print "deactivate",user
            user.is_active = False
            user.email = 'halsorapport@smi.se'
            user.save()
        else:
            print "do not deactivate",user