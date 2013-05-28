# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):

        # Renaming column for 'Application.sensor' to match new field type.
        db.rename_column(u'home_application', 'sensor', 'sensor_id')
        # Changing field 'Application.sensor'
        db.alter_column(u'home_application', 'sensor_id', self.gf('django.db.models.fields.related.ForeignKey')(default='1', to=orm['home.Sensor']))
        # Adding index on 'Application', fields ['sensor']
        db.create_index(u'home_application', ['sensor_id'])


    def backwards(self, orm):
        # Removing index on 'Application', fields ['sensor']
        db.delete_index(u'home_application', ['sensor_id'])


        # Renaming column for 'Application.sensor' to match new field type.
        db.rename_column(u'home_application', 'sensor_id', 'sensor')
        # Changing field 'Application.sensor'
        db.alter_column(u'home_application', 'sensor', self.gf('django.db.models.fields.PositiveIntegerField')(null=True))

    models = {
        u'home.application': {
            'Meta': {'ordering': "['date']", 'object_name': 'Application'},
            'author': ('django.db.models.fields.CharField', [], {'max_length': '15', 'blank': 'True'}),
            'category': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'to': u"orm['home.Category']", 'null': 'True', 'blank': 'True'}),
            'date': ('django.db.models.fields.DateField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'icon': ('django.db.models.fields.CharField', [], {'max_length': '25', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'installed': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '25', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '15'}),
            'picture_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
            'sensor': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['home.Sensor']"})
        },
        u'home.brand': {
            'Meta': {'object_name': 'Brand'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'logo_url': ('django.db.models.fields.URLField', [], {'max_length': '200'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '20'})
        },
        u'home.category': {
            'Meta': {'object_name': 'Category'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '20'})
        },
        u'home.sensor': {
            'Meta': {'ordering': "['date']", 'object_name': 'Sensor'},
            'brand': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'to': u"orm['home.Brand']", 'null': 'True', 'blank': 'True'}),
            'code': ('django.db.models.fields.PositiveIntegerField', [], {}),
            'date': ('django.db.models.fields.DateField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'installed': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'label': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '25', 'blank': 'True'}),
            'number': ('django.db.models.fields.PositiveIntegerField', [], {'null': 'True'}),
            'picture_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
            'price': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '6', 'decimal_places': '2', 'blank': 'True'}),
            'technology': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'to': u"orm['home.Technology']", 'null': 'True', 'blank': 'True'})
        },
        u'home.technology': {
            'Meta': {'object_name': 'Technology'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'logo_url': ('django.db.models.fields.URLField', [], {'max_length': '200'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '20'})
        }
    }

    complete_apps = ['home']