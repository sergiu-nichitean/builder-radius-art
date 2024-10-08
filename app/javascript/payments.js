var stripeInitialized = false;

var initializeStripeOnReady = function() {
  var stripe = Stripe(stripePublishableKey);
  var elements = stripe.elements();

  var cardElement = elements.create('card', {
    style: {
      base: {
        iconColor: '#c4f0ff',
        color: '#fff',
        fontWeight: '500',
        fontFamily: 'Roboto, Open Sans, Segoe UI, sans-serif',
        fontSize: '16px',
        fontSmoothing: 'antialiased',
        ':-webkit-autofill': {
          color: '#fce883',
        },
        '::placeholder': {
          color: '#87BBFD',
        },
      },
      invalid: {
        iconColor: '#FFC7EE',
        color: '#FFC7EE',
      },
    },
  });

  cardElement.mount('#card_element');
  cardElement.on('change', function() {
    $('#paymentError').addClass('d-none');
  });

  $('#payment_form input, #payment_form select').change(function() {
    $('#paymentError').addClass('d-none');
  });

  $('#payment_credits').click(updateTotal);
  $('#payment_credits').change(updateTotal);
  $('#payment_credits').keyup(updateTotal);

  // $('#payment_country').click(show_hide_vat);
  // $('#payment_vat_id').keyup(show_hide_vat);

  $('#payment_form').submit(function(e){
    var $payment_form = $(this);
    e.preventDefault();
    disableSubmit();

    $.post(
      '/payments',
      $payment_form.serialize(),
      function(create_data) {
        console.log('Create data', create_data);
        if(create_data.payment) {
          $.post('/payments/create_payment_intent', create_data, function(data){
            if(data.customer_id) {
              stripe.confirmCardPayment(data.client_secret, {
                payment_method: {
                  card: cardElement,
                  billing_details: {
                    name: currentUserName
                    // address: {
                    //   city: create_data.payment.city,
                    //   country: create_data.payment.country,
                    //   line1: create_data.payment.address_line_1,
                    //   line2: create_data.payment.address_line_2,
                    //   postal_code: create_data.payment.postal_code,
                    //   state: create_data.payment.state
                    // }
                  }
                }
              }).then((result) => {
                if(result.error) {
                  paymentError(result.error.message);
                } else {
                  console.log('Create data', create_data);
                  ajaxPatch(
                    '/payments/' + create_data.payment.id,
                    {
                      payment: {
                        stripe_customer_id: data.customer_id,
                        external_id: data.payment_intent_id
                      }
                    },
                    function(update_data) {
                      if(update_data.success) {
                        window.location = '/';
                      } else {
                        paymentError(update_data.error);
                      }
                    }
                  );
                }
              });
            } else {
              paymentError(data.error);
            }
          });
        } else {
          paymentError(create_data.error);
        }
      }
    );
  });
};

function paymentError(error_text) {
  $('#payment_error').removeClass('d-none').html(error_text);
  enableSubmit()
}

function disableSubmit() {
  $('#submit_payment_form').attr('disabled', true);
  $('#submit_payment_form .spinner-border').removeClass('d-none');
}

function enableSubmit() {
  $('#submit_payment_form').attr('disabled', false);
  $('#submit_payment_form .spinner-border').addClass('d-none');
}

function updateTotal() {
  let total = 0;

  if ($('#payment_credits').val().length > 0) {
    total = parseInt($('#payment_credits').val()) / creditsPerDollar;
  }

  $('#payment_amount').val('$' + (Math.round(total * 100) / 100).toFixed(2));
}

function ajaxPatch(url, data, success, error) {
  $.ajax({
    type: 'PATCH',
    url: url,
    data: data,
    success: success,
    error: error
  });
}

function ajaxDelete(url, success) {
  $.ajax({ type: 'DELETE', url: url, success: success });
}

// function show_hide_vat() {
//   if(
//       (
//         eu_countries.indexOf($('#payment_country').val()) > -1 &&
//         $('#payment_vat_id').val().length < 5
//       ) ||
//       $('#payment_country').val() == 'RO'
//     ) {
//     $('#plus_vat').removeClass('d-none');
//   } else {
//     $('#plus_vat').addClass('d-none');
//   }
// }

$(function(){
  if(!stripeInitialized) {
    initializeStripeOnReady();
    stripeInitialized = true;
  }
});

$(document).on('turbo:load', function(){
  if(!stripeInitialized) {
    initializeStripeOnReady();
    stripeInitialized = true;
  }
});
