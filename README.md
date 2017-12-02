saltstack-kerberos-formula
==========================
A salt formula that installs and configures kerberos.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``kerberos``
------------

Meta state for kerberos.

``kerberos.install``
------------

Installs the kerberos package.

``kerberos.config``
------------

Configures the krb5.conf file.

``kerberos.keytab``
------------

Deploys keytab files.

``kerberos.kdc``
------------

Basic support for Kerberos V5 domain controllers (KDC).
