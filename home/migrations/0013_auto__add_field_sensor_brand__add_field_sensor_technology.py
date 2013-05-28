# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding field 'Sensor.brand'
        db.add_column(u'home_sensor', 'brand',
                      self.gf('django.db.models.fields.related.ForeignKey')(to=orm['home.Brand'], null=True, blank=True),
                      keep_default=False)

        # Adding field 'Sensor.technology'
        db.add_column(u'home_sensor', 'technology',
                      self.gf('django.db.models.fields.related.ForeignKey')(to=orm['home.Technology'], null=True, blank=True),
                      keep_default=False)

        # Removing M2M table for field technology on 'Sensor'
        db.delete_table('home_sensor_technology')

        # Removing M2M table for field brand on 'Sensor'
        db.delete_table('home_sensor_brand')


    def backwards(self, orm):
        # Deleting field 'Sensor.brand'
        db.delete_column(u'home_sensor', 'brand_id')

        # Deleting field 'Sensor.technology'
        db.delete_column(u'home_sensor', 'technology_id')

        # Adding M2M table for field technology on 'Sensor'
        db.create_table(u'home_sensor_technology', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('sensor', models.ForeignKey(orm[u'home.sensor'], null=False)),
            ('technology', models.ForeignKey(orm[u'home.technology'], null=False))
        ))
        db.create_unique(u'home_sensor_technology', ['sensor_id', 'technology_id'])

        # Adding M2M table for field brand on 'Sensor'
        db.create_table(u'home_sensor_brand', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('sensor', models.ForeignKey(orm[u'home.sensor'], null=False)),
            ('brand', models.ForeignKey(orm[u'home.brand'], null=False))
        ))
        db.create_unique(u'home_sensor_brand', ['sensor_id', 'brand_id'])


    models = {
        u'home.application': {
            'Meta': {'ordering': "['date']", 'object_name': 'Application'},
            'author': ('django.db.models.fields.CharField', [], {'max_length': '15', 'blank': 'True'}),
            'category': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['home.Category']", 'null': 'True', 'blank': 'True'}),
            'date': ('django.db.models.fields.DateField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'icon': ('django.db.models.fields.CharField', [], {'max_length': '25', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'installed': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '25', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '15'}),
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
            'name': ('django.db.models.fields.CharField', [], {'max_length': '20'})
        },
        u'home.sensor': {
            'Meta': {'ordering': "['date']", 'object_name': 'Sensor'},
            'brand': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['home.Brand']", 'null': 'True', 'blank': 'True'}),
            'code': ('django.db.models.fields.PositiveIntegerField', [], {}),
            'date': ('django.db.models.fields.DateField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'installed': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'label': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '25', 'blank': 'True'}),
            'number': ('django.db.models.fields.PositiveIntegerField', [], {'null': 'True'}),
            'picture_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
            'price': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '6', 'decimal_places': '2', 'blank': 'True'}),
            'technology': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['home.Technology']", 'null': 'True', 'blank': 'True'})
        },
        u'home.technology': {
            'Meta': {'object_name': 'Technology'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'logo_url': ('django.db.models.fields.URLField', [], {'max_length': '200'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '20'})
        }
    }

    complete_apps = ['home']