# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting field 'ExampleService.logo_url'
        db.delete_column(u'services_exampleservice', 'logo_url')

        # Adding field 'ExampleService.logo'
        db.add_column(u'services_exampleservice', 'logo',
                      self.gf('django.db.models.fields.CharField')(default='', max_length=100, blank=True),
                      keep_default=False)

        # Deleting field 'Package.picture_url'
        db.delete_column(u'services_package', 'picture_url')

        # Adding field 'Package.picture'
        db.add_column(u'services_package', 'picture',
                      self.gf('django.db.models.fields.CharField')(default='', max_length=100, blank=True),
                      keep_default=False)


    def backwards(self, orm):
        # Adding field 'ExampleService.logo_url'
        db.add_column(u'services_exampleservice', 'logo_url',
                      self.gf('django.db.models.fields.CharField')(default='', max_length=200, blank=True),
                      keep_default=False)

        # Deleting field 'ExampleService.logo'
        db.delete_column(u'services_exampleservice', 'logo')

        # Adding field 'Package.picture_url'
        db.add_column(u'services_package', 'picture_url',
                      self.gf('django.db.models.fields.URLField')(default='', max_length=200, blank=True),
                      keep_default=False)

        # Deleting field 'Package.picture'
        db.delete_column(u'services_package', 'picture')


    models = {
        u'services.exampleservice': {
            'Meta': {'ordering': "['id']", 'object_name': 'ExampleService'},
            'additional_description': ('django.db.models.fields.TextField', [], {'max_length': '300', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'logo': ('django.db.models.fields.CharField', [], {'max_length': '100', 'blank': 'True'}),
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
            'picture': ('django.db.models.fields.CharField', [], {'max_length': '100', 'blank': 'True'}),
            'price': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '6', 'decimal_places': '2', 'blank': 'True'})
        }
    }

    complete_apps = ['services']