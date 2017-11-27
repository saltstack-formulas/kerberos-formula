#######################################################################
# This file is managed by salt. Manual changes risk being overwritten. 
# The contents of an example skeleton kdc.conf are stored at the       
# bottom as a quick reference.                                         
#######################################################################

#TODO FUTURE
#
#Hemidal Kerberos only
export KRB5CCNAME={{ krb5ccname }}
export KRB5CCPRINCIPAL={{ krb5ccprincipal }}

#MIT only
export KRB5_KTNAME=<keytab-file>
export KRB5_CLIENT_KTNAME=<client-keytab-file>
export KRB5_KDC_PROFILE=<kdc-config-file>
export KRB5RCACHEDIR=<tempdir>

#Hemidal and MIT
export KRB5HOME={{ krb5_home }}
export KRB5_CONFIG={{ kr5b_config }}

#Any implementation
export PATH=${PATH}:${KRB5HOME}
