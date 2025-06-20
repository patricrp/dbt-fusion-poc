with source as (
  select
    *
  from 
    {{ source('mews_db_prod', 'enterprise') }}
),

model as (
  select
    -- Primary keys (in the application database)
    Id::varchar(36) as pms_property_id,
    -- Foreign keys (in the application database)
    LoginScreenImageId::varchar(36) as login_screen_image_id,
    AddressId::varchar(36) as address_id,
    TimeZoneId::varchar(36) as time_zone_id,
    CityId::varchar(36) as city_id,
    LogoId::varchar(36) as logo_id,
    SubscriptionId::varchar(36) as subscription_id,
    CreatorProfileId::varchar(36) as creator_profile_id,
    UpdaterProfileId::varchar(36) as updater_profile_id,
    TripAdvisorId::string as trip_advisor_id,
    ChainId::varchar(36) as chain_id,
    -- Date fields (in the application database)
    CreatedUtc::timestamp_ntz as pms_property_created_at,
    UpdatedUtc::timestamp_ntz as pms_property_updated_at,
    DeletedUtc::timestamp_ntz as pms_property_deleted_at,
    ExternalCardPaymentsEnabledUtc::timestamp_ntz as external_card_payments_enabled_at,
    -- Time windows (in the application database)
    AccountingEditableHistoryWindowValue::string as accounting_editable_history_window,
    OperationalEditableHistoryWindowValue::string as operational_editable_history_window,
    InactivePaymentCardDeletionPeriodValue::string as inactive_payment_card_deletion_period,
    -- Boolean fields (in the application database)
    IsDeleted::boolean as is_deleted,
    IsMigratedToAbp::boolean as is_migrated_to_abp,
    IsMfaEnforced::boolean as is_mfa_enforced,
    AreExternalCardPaymentsEnabled::boolean as are_external_card_payments_enabled,
    IsDeviceAuthorizationEnforced::boolean as is_device_authorization_enforced,
    -- Enum fields (in the application database)
    Type::int as pms_property_type_code,
    TypeEnumLabel::string as pms_property_type,
    Pricing::int as pms_property_pricing_code,
    PricingEnumLabel::string as pms_property_pricing,
    Options::int as pms_property_options_code,
    OptionsEnumFlags::array<string> as pms_property_options,
    OnboardingStatus::int as pms_property_onboarding_status_code,
    OnboardingStatusEnumFlags::string as pms_property_onboarding_status,
    -- Other enterprise fields (in the application database)
    UniqueName::string as pms_property_unique_name,
    Name::string as pms_property_name,
    Email::string as pms_property_email,
    WebsiteUrl::string as pms_property_website_url,
    Telephone::string as pms_property_telephone,
    LegalEnvironmentCode::string as legal_environment_code,
    DefaultLanguageCode::string as default_language_code,
    DefaultCultureName::string as default_culture_name,
    DefaultCurrencyCode::string as default_currency_code,
    LegalIdentifiersValue::string as legal_identifiers_value,
    GrossAmountTaxPrecision::int as gross_amount_tax_precision,
    ExternalIdentifier::string as pms_property_external_id,
    ProductChampionEmail::string as product_champion_email,
    DefaultSenderEmail::string as default_sender_email,
    AddressCountryCode::string as pms_property_address_country_code,
    InlinedAddressValue::string as inlined_address_value,
    -- Other enterprise fields (enriched via PySpark)
    TimeZoneIdIana::string as pms_property_time_zone_id_iana,
    SpaceCapacity::bigint as space_capacity
  from
    source
)
select
  *
from
  model