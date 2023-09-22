# LDAP in python

## Example

### Iterate over Microsoft AD result list

```python
from ldap3 import Connection, Server, SUBTREE

def fetch_ms_ad_data():
    ad_data = {}

    attributes=['mail', 'uid']
    base_dn = 'o=test'
    search_filter = '(objectclass=user)'

    ldap_password = 'parola'
    ldap_server = Server('https://ad.bazzline.net')
    ldap_username = 'max_power'

    try:
        sasl_mechanism = 'SIMPLE'  # If you need kerberos, use 'GSSAPI'
        with Connection(ldap_server, user=ldap_username, password=ldap_password, auto_bind=False) as connection:
            connection.sasl_mechanism = sasl_mechanism
            connection.sasl_credentials = (ldap_username, ldap_password)
            if not connection.bind():
                print(f"Could not bind: {connection.result}")
                return

            # setup pagination
            page_size = 1000  # maximum amount of entries per "page"/result set
            page_cookie = None  # initial page cookie

            while True:
                connection.search(search_base=base_dn,
                            search_filter=search_filter,
                            search_scope=SUBTREE,
                            size_limit=0,
                            paged_size=page_size,
                            paged_cookie=page_cookie,
                            attributes=attributes
                            )
                for entry in connection.entries:
                    ad_data[entry.uid.value] = {
                        'mail': entry.mail.value
                        'uid': entry.uid.value
                    }

                # ref: https://ldap3.readthedocs.io/en/latest/tutorial_searches.html#simple-paged-search
                page_cookie = connection.result['controls']['1.2.840.113556.1.4.319']['value']['cookie']

                if not page_cookie:
                    break

            connection.unbind()

    except Exception as e:
        print(f"Generic error while fetching data: {e}")

    return ad_data
```

## Links

* [ldap3 documentation: readthedocs.io](https://ldap3.readthedocs.io/en/latest/) - 20230922
