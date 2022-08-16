

from unittest.mock import patch

from django.db.utils import OperationalError
from psycopg2 import OperationalError as psycopg2Error

from django.test import SimpleTestCase

from django.core.management import call_command

