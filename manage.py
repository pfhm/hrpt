import os, sys
if __name__ == "__main__":
	os.environ.setdefault("DJANGO_SETTINGS_MODULE", "settings") # New standard is to have projectname.settings. but kept this for compatibility.
	from django.core.management import execute_from_command_line
	execute_from_command_line(sys.argv)

