# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Package'
        db.create_table(u'services_package', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('lead', self.gf('django.db.models.fields.CharField')(max_length=200, blank=True)),
            ('picture_url', self.gf('django.db.models.fields.URLField')(max_length=200, blank=True)),
            ('general_description', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('additional_description', self.gf('django.db.models.fields.CharField')(max_length=500, blank=True)),
            ('price', self.gf('django.db.models.fields.CharField')(max_length=200, blank=True)),
            ('extra_field_1', self.gf('django.db.models.fields.CharField')(max_length=200, blank=True)),
            ('extra_field_2', self.gf('django.db.models.fields.CharField')(max_length=200, blank=True)),
            ('extra_field_3', self.gf('django.db.models.fields.CharField')(max_length=200, blank=True)),
        ))
        db.send_create_signal(u'services', ['Package'])

        # Adding model 'Category'
        db.create_table(u'services_category', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('lead', self.gf('django.db.models.fields.CharField')(max_length=200, blank=True)),
        ))
        db.send_create_signal(u'services', ['Category'])

        # Adding model 'Technology'
        db.create_table(u'services_technology', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('lead', self.gf('django.db.models.fields.CharField')(max_length=200, blank=True)),
        ))
        db.send_create_signal(u'services', ['Technology'])

        # Adding model 'Sensor'
        db.create_table(u'services_sensor', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('lead', self.gf('django.db.models.fields.CharField')(max_length=200, blank=True)),
            ('picture_url', self.gf('django.db.models.fields.URLField')(max_length=200, blank=True)),
            ('description', self.gf('django.db.models.fields.CharField')(max_length=200, blank=True)),
            ('price', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=6, decimal_places=2, blank=True)),
            ('installed', self.gf('django.db.models.fields.NullBooleanField')(null=True, blank=True)),
        ))
        db.send_create_signal(u'services', ['Sensor'])

        # Adding M2M table for field technology on 'Sensor'
        db.create_table(u'services_sensor_technology', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('sensor', models.ForeignKey(orm[u'services.sensor'], null=False)),
            ('technology', models.ForeignKey(orm[u'services.technology'], null=False))
        ))
        db.create_unique(u'services_sensor_technology', ['sensor_id', 'technology_id'])

        # Adding model 'Service'
        db.create_table(u'services_service', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('lead', self.gf('django.db.models.fields.CharField')(max_length=200, blank=True)),
            ('picture_url', self.gf('django.db.models.fields.URLField')(max_length=200, blank=True)),
            ('general_description', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('additional_description', self.gf('django.db.models.fields.CharField')(max_length=500, blank=True)),
            ('extra_field_1', self.gf('django.db.models.fields.CharField')(max_length=200, blank=True)),
            ('extra_field_2', self.gf('django.db.models.fields.CharField')(max_length=200, blank=True)),
            ('price', self.gf('django.db.models.fields.DecimalField')(null=True, max_digits=6, decimal_places=2, blank=True)),
            ('connected', self.gf('django.db.models.fields.NullBooleanField')(null=True, blank=True)),
        ))
        db.send_create_signal(u'services', ['Service'])

        # Adding M2M table for field sensors on 'Service'
        db.create_table(u'services_service_sensors', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('service', models.ForeignKey(orm[u'services.service'], null=False)),
            ('sensor', models.ForeignKey(orm[u'services.sensor'], null=False))
        ))
        db.create_unique(u'services_service_sensors', ['service_id', 'sensor_id'])

        # Adding M2M table for field package on 'Service'
        db.create_table(u'services_service_package', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('service', models.ForeignKey(orm[u'services.service'], null=False)),
            ('package', models.ForeignKey(orm[u'services.package'], null=False))
        ))
        db.create_unique(u'services_service_package', ['service_id', 'package_id'])

        # Adding M2M table for field category on 'Service'
        db.create_table(u'services_service_category', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('service', models.ForeignKey(orm[u'services.service'], null=False)),
            ('category', models.ForeignKey(orm[u'services.category'], null=False))
        ))
        db.create_unique(u'services_service_category', ['service_id', 'category_id'])


    def backwards(self, orm):
        # Deleting model 'Package'
        db.delete_table(u'services_package')

        # Deleting model 'Category'
        db.delete_table(u'services_category')

        # Deleting model 'Technology'
        db.delete_table(u'services_technology')

        # Deleting model 'Sensor'
        db.delete_table(u'services_sensor')

        # Removing M2M table for field technology on 'Sensor'
        db.delete_table('services_sensor_technology')

        # Deleting model 'Service'
        db.delete_table(u'services_service')

        # Removing M2M table for field sensors on 'Service'
        db.delete_table('services_service_sensors')

        # Removing M2M table for field package on 'Service'
        db.delete_table('services_service_package')

        # Removing M2M table for field category on 'Service'
        db.delete_table('services_service_category')


    models = {
        u'services.category': {
            'Meta': {'ordering': "['id']", 'object_name': 'Category'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        u'services.package': {
            'Meta': {'ordering': "['id']", 'object_name': 'Package'},
            'additional_description': ('django.db.models.fields.CharField', [], {'max_length': '500', 'blank': 'True'}),
            'extra_field_1': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'extra_field_2': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'extra_field_3': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'general_description': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'picture_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
            'price': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'})
        },
        u'services.sensor': {
            'Meta': {'ordering': "['id']", 'object_name': 'Sensor'},
            'description': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'installed': ('django.db.models.fields.NullBooleanField', [], {'null': 'True', 'blank': 'True'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'picture_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
            'price': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '6', 'decimal_places': '2', 'blank': 'True'}),
            'technology': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['services.Technology']", 'symmetrical': 'False'})
        },
        u'services.service': {
            'Meta': {'ordering': "['id']", 'object_name': 'Service'},
            'additional_description': ('django.db.models.fields.CharField', [], {'max_length': '500', 'blank': 'True'}),
            'category': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['services.Category']", 'symmetrical': 'False'}),
            'connected': ('django.db.models.fields.NullBooleanField', [], {'null': 'True', 'blank': 'True'}),
            'extra_field_1': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'extra_field_2': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'general_description': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'package': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['services.Package']", 'symmetrical': 'False'}),
            'picture_url': ('django.db.models.fields.URLField', [], {'max_length': '200', 'blank': 'True'}),
            'price': ('django.db.models.fields.DecimalField', [], {'null': 'True', 'max_digits': '6', 'decimal_places': '2', 'blank': 'True'}),
            'sensors': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['services.Sensor']", 'symmetrical': 'False'})
        },
        u'services.technology': {
            'Meta': {'ordering': "['id']", 'object_name': 'Technology'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'lead': ('django.db.models.fields.CharField', [], {'max_length': '200', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        }
    }

    complete_apps = ['services']