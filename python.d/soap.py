####
# This example shows how you could instantiate a soap client for suds-py3 and zeep
#   using UsernameToken authentification.
#
# pip install suds-py3 1.4.5.0
# pip install zeep 4.2.1
####
# ref:
#   https://suds-py3.readthedocs.io/en/latest/
#   https://docs.python-zeep.org/en/master
####

from suds.client import Client as sudsClient
from suds.wsse import Security as sudsSecurity, UsernameToken as sudsUsernameToke
from zeep import Client as zeepClient
from zeep.wsse.username import UsernameToken as zeepUsernameToken

def _create_suds_soap_client(service_url_suffix: str) -> sudsClient:
    base_url = environ['SOAP_BASE_URL']
    password = environ['SOAP_PASSWORD']
    username = environ['SOAP_USERNAME']

    wsdl_url = f'{base_url}/{service_url_suffix}?wsdl'

    client = sudsClient(url=wsdl_url)
    username_token = sudsUsernameToke(password=password, username=username)
    security = sudsSecurity()

    security.tokens.append(username_token)

    client.set_options(wsse=security, timeout=10)

    return client


def _create_zeep_client(service_url_suffix: str) -> zeepClient:
    base_url = environ['SOAP_BASE_URL']
    password = environ['SOAP_PASSWORD']
    username = environ['SOAP_USERNAME']

    wsdl_url = f'{base_url}/{service_url_suffix}?wsdl'

    return zeepClient(
        wsdl=wsdl_url,
        wsse=zeepUsernameToken(password=password, username=username),
    )

def main():
    suds_client = _create_suds_soap_client('ExampleService')
    zeep_client = _create_zeep_client('ExampleService')

    suds_result = suds_client.service.fooActon(foo='bar')
    zeep_result = zeep_client.service.fooActon(foo='bar')

    print(suds_result)
    print(zeep_result)

if __name__ == '__main__':
    main()
