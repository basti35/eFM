# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting field 'Application.extra_field_2'
        db.delete_column(u'home_application', 'extra_field_2')

        # Deleting field 'Application.extra_field_1'
        db.delete_column(u'home_application', 'extra_field_1')

        # Deleting field 'Application.code'
        db.delete_column(u'home_application', 'code')

        # Deleting field 'Application.price'
        db.delete_column(u'home_application', 'price')

        # Deleting field 'Application.additional_description'
        db.delete_column(u'home_application', 'additional_description')

        # Deleting field 'Application.general_description'
        db.delete_column(u'home_application', 'general_description')


        # Changing field 'Application.installed'
        db.alter_column(u'home_application', 'installed', self.gf('django.db.models.fields.BooleanField')())
        # Deleting field 'Technology.lead'
        db.delete_column(u'home_technology', 'lead')

        # Deleting field 'Sensor.description'
        db.delete_column(u'home_sensor', 'description')


        # Changing field 'Sensor.installed'
        db.alter_column(u'home_sensor', 'installed', self.gf('django.db.models.fields.BooleanField')())

    def backwards(self, orm):
        # Adding field 'Application.extra_field_2'
        db.add_column(u'home_application', 'extra_field_2',
                      self.gf('django.db.models.fields.CharField')(default='', max_length=200, blank=True),
                      keep_default=False)

        # Adding field 'Application.extra_field_1'
        db.add_column(u'home_application', 'extra_field_1',
                      self.gf('django.db.models.fields.CharField')(default='', max_length=200, blank=True),
                      keep_default=False)

        # Adding field 'Application.code'
        db.add_column(u'home_application', 'code',
                      self.gf('django.db.models.fields.PositiveIntegerField')(null=True),
                      keep_default=False)

        # Adding field 'Application.price'
        db.add_column(u'home_application', 'price',
                      self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=6, decimal_places=2, blank=True),
                      keep_default=False)

        # Adding field 'Application.additional_description'
        db.add_column(u'home_application', 'additional_description',
                      self.gf('django.db.models.fields.TextField')(default='', max_length=500, blank=True),
                      keep_default=False)


        # User chose to not deal with backwards NULL issues for 'Application.general_description'
        raise RuntimeError("Cannot reverse this migration. 'Application.general_description' and its values cannot be restored.")

        # Changing field 'Application.installed'
        db.alter_column(u'home_application', 'installed', self.gf('django.db.models.fields.NullBooleanField')(null=True))
        # Adding field 'Technology.lead'
        db.add_column(u'home_technology', 'lead',
                      self.gf('django.db.models.fields.CharField')(default='', max_length=100, blank=True),
                      keep_default=False)

        # Adding field 'Sensor.description'
        db.add_column(u'home_sensor', 'description',
                      self.gf('django.db.models.fields.CharField')(default='', max_length=200, blank=True),
                      keep_default=False)


        # Changing field 'Sensor.installed'
        db.alter_column(u'home_sensor', 'installed', self.gf('django.db.models.fields.NullBooleanField')(null=True))

    models = {
        u'home.application': {
            'Meta': {'ordering': "['date']", 'object_name': 'Application'},
            'category': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'to': u"orm['home.Category']", 'null': 'True', 'blank': 'True'}),
            'date': ('django.db.models.fields.DateField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'installed': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '25', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '15'}),
            'number': ('django.db.models.fields.PositiveIntegerField', [], {'null': 'True'}),
            'picture_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
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
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'installed': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'label': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '25', 'blank': 'True'}),
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