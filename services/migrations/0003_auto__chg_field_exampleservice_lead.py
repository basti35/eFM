# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):

        # Changing field 'ExampleService.lead'
        db.alter_column(u'services_exampleservice', 'lead', self.gf('django.db.models.fields.CharField')(max_length=50))

    def backwards(self, orm):

        # Changing field 'ExampleService.lead'
        db.alter_column(u'services_exampleservice', 'lead', self.gf('django.db.models.fields.CharField')(max_length=25))

    models = {
        u'services.exampleservice': {
            'Meta': {'ordering': "['id']", 'object_name': 'ExampleService'},
            'additional_description': ('django.db.models.fields.TextField', [], {'max_length': '300', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'logo_url': ('django.db.models.fields.URLField', [], {'max_length': '200'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '15'}),
            'sensor_1': ('django.db.models.fields.CharField', [], {'max_length': '20', 'blank': 'True'}),
            'sensor_2': ('django.db.models.fields.CharField', [], {'max_length': '20', 'blank': 'True'}),
            'service_description': ('django.db.models.fields.TextField', [], {'max_length': '200'})
        }
    }

    complete_apps = ['services']