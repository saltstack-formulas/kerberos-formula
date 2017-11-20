{% from "kerberos/map.jinja" import kerberos with context %}

{% if kerberos.pkg is defined %}
#legacy pillar structure

kerberos-tools:
  pkg.installed:
    - name: {{ kerberos.pkg }}

{% else %}
#updated pillar structure or no pillars defined

kerberos-krb5-client:
  pkg.installed:
    - name: {{ kerberos.krb5.client }}

{% endif %}

