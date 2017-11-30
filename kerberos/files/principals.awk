#TODO - FUTURE MAYBE
#
# jinja2 contexts: 
# - principals = dict of user:pass
# - action = add
# - kadmin_local = full path to kadmin.local binary
#
# TODO ......

# Task 1: Pillar dictionary of principals/users
#
# kerberos:
#   kdc:
#     principals:
#       ATHENA.MIT.EDU:
#         steve:
#           passwd: RfgpE2iQwD
#           roles: admin
#           action: add
#         admin:
#           passwd: RfgpE2iQwD
#           roles: admin
#           action: add

# Task 2: Add to KDC method
# See: https://docs.oracle.com/cd/E36784_01/html/E37126/aadmin-192.html for ideas
#

awk '{ print "ank +needchange -pw", $2, $1 }' << EOF
{%- for user,password in {{ principals }} -%}
  {{ user }} {{ pass }}
{%- endfor -%}
EOF | time {{ kadmin_local }} > /dev/null

# Task 3: Remove from KDC method?
#???? how, why, when ???
