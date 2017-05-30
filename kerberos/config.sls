{% from "kerberos/map.jinja" import kerberos with context %}

{% if kerberos.libdefaults is defined or kerberos.realms is defined %}
#legacy pillar structure

/etc/krb5.conf:
  file.managed:
    - user: root
    - source: salt://kerberos/files/krb5.conf.jinja
    - group: {{ kerberos.get('root_group', 'root') }}
    - mode: 644
    - template: jinja

{% else %}
#updated pillar structure or no pillars defined

kerberos-krb5-config:
  file.managed:
    - name: {{ kerberos.krb5.client_config }}
    - source: salt://kerberos/files/krb5.conf
    - user: root
    - group: {{ kerberos.get('krb5:root_group', 'root') }}
    - mode: 644
    - template: jinja

{% endif %}
