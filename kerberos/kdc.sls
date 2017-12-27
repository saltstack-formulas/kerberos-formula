{% from "kerberos/map.jinja" import kerberos with context %}

{% if grains.os not in ('MacOS', 'Windows',) %}

kerberos_kdc:
  pkg.installed:
    - names:
      - {{ kerberos.kdc.server }}
      - {{ kerberos.kdc.adm_server }}
      - {{ kerberos.krb5.client }}
    - require_in:
      file: kerberos_kdc
  file.managed:
    - name: {{ kerberos.kdc.config }}
    - source: {{ kerberos.kdc.config_src }}
    - template: jinja
    - user: root
    - group: {{ kerberos.get('krb5:root_group', 'root') }}
    - mode: 0644
    - require_in:
      - file: kerberos_kdc_realms_kprop_acl

kerberos_kdc_realms_kprop_acl:
  file.managed:
    - name: {{ kerberos.kdc.kprop_acl_file }}
    - source: {{ kerberos.kdc.kprop_acl_file_src }}
    - template: jinja
    - user: root
    - group: {{ kerberos.get('krb5:root_group', 'root') }}
    - mode: 0644
    - require_in:
      - file: kerberos_kdc_realms_kadm5_acl
    - context:
      default_master: {{ kerberos.kdc.default_master }}
      default_slave: {{ kerberos.kdc.default_slave or kerberos.kdc.default_master }}
      default_domain: {{ kerberos.krb5.libdefaults.default_domain }}
      default_realm: {{ kerberos.krb5.libdefaults.default_realm }}

kerberos_kdc_realms_kadm5_acl:
  file.managed:
    - name: {{ kerberos.kdc.acl_file }}
    - source: {{ kerberos.kdc.acl_file_src }}
    - template: jinja
    - user: root
    - group: {{ kerberos.get('krb5:root_group', 'root') }}
    - mode: 0644
    - context:
      default_realm: {{ kerberos.krb5.libdefaults.default_realm }}

{% endif %}
