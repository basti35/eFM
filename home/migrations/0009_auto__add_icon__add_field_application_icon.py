# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Icon'
        db.create_table(u'home_icon', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=20)),
        ))
        db.send_create_signal(u'home', ['Icon'])

        # Adding field 'Application.icon'
        db.add_column(u'home_application', 'icon',
                      self.gf('django.db.models.fields.related.ForeignKey')(to=orm['home.Icon'], null=True, blank=True),
                      keep_default=False)


    def backwards(self, orm):
        # Deleting model 'Icon'
        db.delete_table(u'home_icon')

        # Deleting field 'Application.icon'
        db.delete_column(u'home_application', 'icon_id')


    models = {
        u'home.application': {
            'Meta': {'ordering': "['date']", 'object_name': 'Application'},
            'author': ('django.db.models.fields.CharField', [], {'max_length': '15', 'blank': 'True'}),
            'category': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'to': u"orm['home.Category']", 'null': 'True', 'blank': 'True'}),
            'date': ('django.db.models.fields.DateField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'icon': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['home.Icon']", 'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'installed': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '25', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '15'}),
            'picture_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
            'sensor': ('django.db.models.fields.PositiveIntegerField', [], {'null': 'True'})
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
        u'home.icon': {
            'Meta': {'object_name': 'Icon'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
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