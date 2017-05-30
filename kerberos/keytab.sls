{% from "kerberos/map.jinja" import kerberos with context %}
#Legacy pillar structure
{%- set keytabs = salt['pillar.get']('kerberos:keytabs') -%}

#New pillar structure or no pillars
{% if kerberos.kdc.keytabs %}
  {%- set keytabs = kerberos.kdc.keytabs -%}
{% endif %}

/etc/krb5:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
    - makedirs: True

{%- for keytab in keytabs %}
/etc/krb5/{{ keytab }}:
  file.managed:
    - user: root
    - source: salt://kerberos/files/{{ keytab }}
    - group: {{ kerberos.krb5.get('root_group', 'root') }}
    - template: jinja
{%- endfor %}
