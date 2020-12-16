# Azure AD B2C with multitenant Azure AD and deployment automation

This sample illustrates how to use Azure AD B2C with Azure AD (configured to accept sign ins from any Azure AD tenant). It also illustrates how to use GitHub Actions to deploy custom policies.

## Variables

In order to deploy this to your own GitHub repository and against your own Azure AD B2C tenant, you will need to configure the following secrets in your GitHub repository:

| Setting name                                  | Description                                                                                                                                                                                                                               |
|-----------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `AAD_MULTI_TENANT_APP_CLIENT_ID`              | The client ID of the [multitenant Azure AD app](https://docs.microsoft.com/en-us/azure/active-directory-b2c/identity-provider-azure-ad-multi-tenant?pivots=b2c-custom-policy) created in a standard Azure AD tenant, not your B2C tenant. |
| `B2C_DEPLOYMENT_CLIENT_ID`                    | The client ID of the [deployment application](https://docs.microsoft.com/en-us/azure/active-directory-b2c/microsoft-graph-get-started?tabs=app-reg-ga) created within your B2C tenant.                                                    |
| `B2C_DEPLOYMENT_CLIENT_SECRET`                | The client secret of the [deployment application](https://docs.microsoft.com/en-us/azure/active-directory-b2c/microsoft-graph-get-started?tabs=app-reg-ga) created within your B2C tenant.                                                |
| `B2C_IDENTITY_EXPERIENCE_APP_CLIENT_ID`       | The client ID of the [`IdentityExperienceFramework` app](https://docs.microsoft.com/en-us/azure/active-directory-b2c/custom-policy-get-started#register-identity-experience-framework-applications) created within your B2C tenant.       |
| `B2C_PROXY_IDENTITY_EXPERIENCE_APP_CLIENT_ID` | The client ID of the [`ProxyIdentityExperienceFramework` app](https://docs.microsoft.com/en-us/azure/active-directory-b2c/custom-policy-get-started#register-identity-experience-framework-applications) created within your B2C tenant.  |
| `B2C_TENANT_ID`                               | The tenant ID (a GUID) of your B2C tenant.                                                                                                                                                                                                |
| `B2C_TENANT_NAME`                             | The name of your B2C tenant. If your B2C tenant has a domain of `myb2ctenant.onmicrosoft.com` then the value of this variable should be `myb2ctenant`.                                                                                    |
| `FACEBOOK_APP_ID`                             | The App ID of the [Facebook app you created](https://docs.microsoft.com/en-us/azure/active-directory-b2c/identity-provider-facebook?pivots=b2c-custom-policy) to enable Facebook login.                                                   |
