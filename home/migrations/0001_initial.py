# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Technology'
        db.create_table(u'home_technology', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('lead', self.gf('django.db.models.fields.CharField')(max_length=100, blank=True)),
            ('logo_url', self.gf('django.db.models.fields.URLField')(max_length=200, blank=True)),
        ))
        db.send_create_signal(u'home', ['Technology'])

        # Adding model 'Sensor'
        db.create_table(u'home_sensor', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('label', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('code', self.gf('django.db.models.fields.PositiveIntegerField')()),
            ('lead', self.gf('django.db.models.fields.CharField')(max_length=25, blank=True)),
            ('picture_url', self.gf('django.db.models.fields.URLField')(max_length=200, blank=True)),
            ('description', self.gf('django.db.models.fields.CharField')(max_length=200, blank=True)),
            ('price', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=6, decimal_places=2, blank=True)),
            ('installed', self.gf('django.db.models.fields.NullBooleanField')(null=True, blank=True)),
            ('date', self.gf('django.db.models.fields.DateField')(auto_now_add=True, blank=True)),
        ))
        db.send_create_signal(u'home', ['Sensor'])

        # Adding M2M table for field technology on 'Sensor'
        db.create_table(u'home_sensor_technology', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('sensor', models.ForeignKey(orm[u'home.sensor'], null=False)),
            ('technology', models.ForeignKey(orm[u'home.technology'], null=False))
        ))
        db.create_unique(u'home_sensor_technology', ['sensor_id', 'technology_id'])

        # Adding model 'Category'
        db.create_table(u'home_category', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('lead', self.gf('django.db.models.fields.CharField')(max_length=200, blank=True)),
        ))
        db.send_create_signal(u'home', ['Category'])

        # Adding model 'Package'
        db.create_table(u'home_package', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('lead', self.gf('django.db.models.fields.CharField')(max_length=35, blank=True)),
            ('picture_url', self.gf('django.db.models.fields.URLField')(max_length=200, blank=True)),
            ('general_description', self.gf('django.db.models.fields.TextField')(max_length=200)),
            ('additional_description', self.gf('django.db.models.fields.TextField')(max_length=500, blank=True)),
            ('price', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=6, decimal_places=2, blank=True)),
        ))
        db.send_create_signal(u'home', ['Package'])

        # Adding model 'Application'
        db.create_table(u'home_application', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=15)),
            ('lead', self.gf('django.db.models.fields.CharField')(max_length=25, blank=True)),
            ('picture_url', self.gf('django.db.models.fields.URLField')(max_length=200, blank=True)),
            ('general_description', self.gf('django.db.models.fields.TextField')(max_length=200)),
            ('additional_description', self.gf('django.db.models.fields.TextField')(max_length=500, blank=True)),
            ('extra_field_1', self.gf('django.db.models.fields.CharField')(max_length=200, blank=True)),
            ('extra_field_2', self.gf('django.db.models.fields.CharField')(max_length=200, blank=True)),
            ('price', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=6, decimal_places=2, blank=True)),
            ('installed', self.gf('django.db.models.fields.NullBooleanField')(null=True, blank=True)),
            ('date', self.gf('django.db.models.fields.DateField')(auto_now_add=True, blank=True)),
        ))
        db.send_create_signal(u'home', ['Application'])

        # Adding M2M table for field sensors on 'Application'
        db.create_table(u'home_application_sensors', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('application', models.ForeignKey(orm[u'home.application'], null=False)),
            ('sensor', models.ForeignKey(orm[u'home.sensor'], null=False))
        ))
        db.create_unique(u'home_application_sensors', ['application_id', 'sensor_id'])

        # Adding M2M table for field package on 'Application'
        db.create_table(u'home_application_package', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('application', models.ForeignKey(orm[u'home.application'], null=False)),
            ('package', models.ForeignKey(orm[u'home.package'], null=False))
        ))
        db.create_unique(u'home_application_package', ['application_id', 'package_id'])

        # Adding M2M table for field category on 'Application'
        db.create_table(u'home_application_category', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('application', models.ForeignKey(orm[u'home.application'], null=False)),
            ('category', models.ForeignKey(orm[u'home.category'], null=False))
        ))
        db.create_unique(u'home_application_category', ['application_id', 'category_id'])


    def backwards(self, orm):
        # Deleting model 'Technology'
        db.delete_table(u'home_technology')

        # Deleting model 'Sensor'
        db.delete_table(u'home_sensor')

        # Removing M2M table for field technology on 'Sensor'
        db.delete_table('home_sensor_technology')

        # Deleting model 'Category'
        db.delete_table(u'home_category')

        # Deleting model 'Package'
        db.delete_table(u'home_package')

        # Deleting model 'Application'
        db.delete_table(u'home_application')

        # Removing M2M table for field sensors on 'Application'
        db.delete_table('home_application_sensors')

        # Removing M2M table for field package on 'Application'
        db.delete_table('home_application_package')

        # Removing M2M table for field category on 'Application'
        db.delete_table('home_application_category')


    models = {
        u'home.application': {
            'Meta': {'ordering': "['date']", 'object_name': 'Application'},
            'additional_description': ('django.db.models.fields.TextField', [], {'max_length': '500', 'blank': 'True'}),
            'category': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'to': u"orm['home.Category']", 'null': 'True', 'blank': 'True'}),
            'date': ('django.db.models.fields.DateField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'extra_field_1': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'extra_field_2': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'general_description': ('django.db.models.fields.TextField', [], {'max_length': '200'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'installed': ('django.db.models.fields.NullBooleanField', [], {'null': 'True', 'blank': 'True'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '25', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '15'}),
            'package': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'to': u"orm['home.Package']", 'null': 'True', 'blank': 'True'}),
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
        u'home.package': {
            'Meta': {'object_name': 'Package'},
            'additional_description': ('django.db.models.fields.TextField', [], {'max_length': '500', 'blank': 'True'}),
            'general_description': ('django.db.models.fields.TextField', [], {'max_length': '200'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '35', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'picture_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
            'price': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '6', 'decimal_places': '2', 'blank': 'True'})
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