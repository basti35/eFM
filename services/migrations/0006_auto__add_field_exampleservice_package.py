# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding field 'ExampleService.package'
        db.add_column(u'services_exampleservice', 'package',
                      self.gf('django.db.models.fields.related.ForeignKey')(to=orm['services.Package'], null=True, blank=True),
                      keep_default=False)


    def backwards(self, orm):
        # Deleting field 'ExampleService.package'
        db.delete_column(u'services_exampleservice', 'package_id')


    models = {
        u'services.exampleservice': {
            'Meta': {'ordering': "['id']", 'object_name': 'ExampleService'},
            'additional_description': ('django.db.models.fields.TextField', [], {'max_length': '300', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'logo_url': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '15'}),
            'package': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['services.Package']", 'null': 'True', 'blank': 'True'}),
            'sensor_1': ('django.db.models.fields.CharField', [], {'max_length': '20', 'blank': 'True'}),
            'sensor_2': ('django.db.models.fields.CharField', [], {'max_length': '20', 'blank': 'True'}),
            'service_description': ('django.db.models.fields.TextField', [], {'max_length': '200'})
        },
        u'services.package': {
            'Meta': {'object_name': 'Package'},
            'additional_description': ('django.db.models.fields.TextField', [], {'max_length': '500', 'blank': 'True'}),
            'general_description': ('django.db.models.fields.TextField', [], {'max_length': '200'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '35', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'picture_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
            'price': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '6', 'decimal_places': '2', 'blank': 'True'})
        }
    }

    complete_apps = ['services']