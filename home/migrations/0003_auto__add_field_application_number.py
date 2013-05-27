# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding field 'Application.number'
        db.add_column(u'home_application', 'number',
                      self.gf('django.db.models.fields.PositiveIntegerField')(null=True),
                      keep_default=False)


    def backwards(self, orm):
        # Deleting field 'Application.number'
        db.delete_column(u'home_application', 'number')


    models = {
        u'home.application': {
            'Meta': {'ordering': "['date']", 'object_name': 'Application'},
            'additional_description': ('django.db.models.fields.TextField', [], {'max_length': '500', 'blank': 'True'}),
            'category': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'to': u"orm['home.Category']", 'null': 'True', 'blank': 'True'}),
            'code': ('django.db.models.fields.PositiveIntegerField', [], {'null': 'True'}),
            'date': ('django.db.models.fields.DateField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'extra_field_1': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'extra_field_2': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'general_description': ('django.db.models.fields.TextField', [], {'max_length': '200'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'installed': ('django.db.models.fields.NullBooleanField', [], {'null': 'True', 'blank': 'True'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '25', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '15'}),
            'number': ('django.db.models.fields.PositiveIntegerField', [], {'null': 'True'}),
            'picture_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
            'price': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '6', 'decimal_places': '2', 'blank': 'True'}),
            'sensors': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'to': u"orm['home.Sensor']", 'null': 'True', 'blank': 'True'})
        },
        u'home.category': {
            'Meta': {'object_name': 'Category'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '20'})
        },
        u'home.sensor': {
            'Meta': {'ordering': "['date']", 'object_name': 'Sensor'},
            'code': ('django.db.models.fields.PositiveIntegerField', [], {}),
            'date': ('django.db.models.fields.DateField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'description': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'installed': ('django.db.models.fields.NullBooleanField', [], {'null': 'True', 'blank': 'True'}),
            'label': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '25', 'blank': 'True'}),
            'picture_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
            'price': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '6', 'decimal_places': '2', 'blank': 'True'}),
            'technology': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'to': u"orm['home.Technology']", 'null': 'True', 'blank': 'True'})
        },
        u'home.technology': {
            'Meta': {'object_name': 'Technology'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '100', 'blank': 'True'}),
            'logo_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '20'})
        }
    }

    complete_apps = ['home']