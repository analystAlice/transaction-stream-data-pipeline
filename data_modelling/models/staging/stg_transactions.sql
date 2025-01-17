{{ config(
    materialized='table'
) }}

with source_data as (
    SELECT
        amount,
        amount_captured,
        amount_refunded,
        "application",
        application_fee,
        application_fee_amount,
        balance_transaction,
        billing_details_address_city,
        billing_details_address_country,
        billing_details_address_line1,
        billing_details_address_line2,
        billing_details_address_postal_code,
        billing_details_address_state,
        billing_details_email,
        billing_details_name,
        billing_details_phone,
        calculated_statement_descriptor,
        captured,
        created,
        currency,
        customer,
        "description",
        destination,
        dispute,
        disputed,
        failure_balance_transaction,
        failure_code,
        failure_message,
        id,
        invoice,
        livemode,
        "object",
        on_behalf_of,
        "order",
        outcome_network_status,
        outcome_reason,
        outcome_risk_level,
        outcome_risk_score,
        outcome_seller_message,
        outcome_type,
        paid,
        payment_intent,
        payment_method,
        payment_method_details_card_amount_authorized,
        payment_method_details_card_brand,
        payment_method_details_card_checks_address_line1_check,
        payment_method_details_card_checks_address_postal_code_check,
        payment_method_details_card_checks_cvc_check,
        payment_method_details_card_country,
        payment_method_details_card_exp_month,
        payment_method_details_card_exp_year,
        payment_method_details_card_extended_authorization_status,
        payment_method_details_card_fingerprint,
        payment_method_details_card_funding,
        payment_method_details_card_incremental_authorization_status,
        payment_method_details_card_installments,
        payment_method_details_card_last4,
        payment_method_details_card_mandate,
        payment_method_details_card_multicapture_status,
        payment_method_details_card_network,
        payment_method_details_card_network_token_used,
        payment_method_details_card_overcapture_maximum_amount,
        payment_method_details_card_overcapture_status,
        payment_method_details_card_three_d_secure,
        payment_method_details_card_wallet,
        payment_method_details_type,
        receipt_email,
        receipt_number,
        receipt_url,
        refunded,
        review,
        shipping,
        source_address_city,
        source_address_country,
        source_address_line1,
        source_address_line1_check,
        source_address_line2,
        source_address_state,
        source_address_zip,
        source_address_zip_check,
        source_brand,
        source_country,
        source_customer,
        source_cvc_check,
        source_dynamic_last4,
        source_exp_month,
        source_exp_year,
        source_fingerprint,
        source_funding,
        source_id,
        source_last4,
        source_name,
        source_object,
        source_tokenization_method,
        source_wallet,
        source_transfer,
        statement_descriptor,
        statement_descriptor_suffix,
        "status",
        transfer_data,
        transfer_group
    FROM {{ source('postgres', 'transactions') }}
)

select * from source_data

{% if var("is_dev_run", default=true) %} limit 100 {% endif %}