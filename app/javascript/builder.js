function showLoadingModal() {
  let loadingModal = new bootstrap.Modal('#loading_modal');
  loadingModal.show();
  resetProgressBar();
  advanceProgressBar();
}

function generateAiSong() {
  resetProgressBar();
  advanceProgressBar();
  $('#ai_song_form').submit();
}

const progressSeconds = 180;
let currentPercentage = 10;
let progressInterval = 0;

function advanceProgressBar() {
  progressInterval = setInterval(advanceProgressBarPercent, 1000);
}

function advanceProgressBarPercent() {
  if (currentPercentage < 100) {
    currentPercentage = currentPercentage + ((100 - currentPercentage) / progressSeconds);
    $('#progress_bar .progress-bar').css('width', currentPercentage + '%');
    $('#progress_bar .progress-bar').html(Math.ceil(currentPercentage) + '%');
    $('#progress_bar').attr('aria-valuenow', Math.ceil(currentPercentage));
  } else {
    clearInterval(progressInterval);
  }
}

function resetProgressBar() {
  $('#progress_bar .progress-bar').css('width', '10%');
  $('#progress_bar .progress-bar').html('10%');
  $('#progress_bar').attr('aria-valuenow', '10');
  clearInterval(progressInterval);
  currentPercentage = 10;
}

function pollForSite(siteId) {
  setInterval(function() {
    $.get('/sites/' + siteId, function(data) {
      if (data.status != 'pending') {
        location.reload();
      }
    });
  }, 5000);
}

function refreshPrompt() {
  let promptValues = [];

  if($('#generate_genres .clickable-option.active span').length > 0 && $('#generate_genres .clickable-option.active span').html().length > 0) {
    promptValues.push('Genre: ' + $('#generate_genres .clickable-option.active span').html().replace('&amp;', '&'));
  }

  if($('#generate_subgenres').prop('disabled') == false) {
    promptValues.push('Sub-genre: ' + $('#generate_subgenres').val());
  }

  if($('#generate_instruments').prop('disabled') == false) {
    promptValues.push('Main instrument: ' + $('#generate_instruments').val());
  }

  if($('#generate_moods .clickable-text-option.active').length > 0 && $('#generate_moods .clickable-text-option.active').html().length > 0) {
    promptValues.push('Mood: ' + $('#generate_moods .clickable-text-option.active').html());
  }

  if($('#generate_vocals .clickable-text-option.active').length > 0 && $('#generate_vocals .clickable-text-option.active').html().length > 0) {
    let vocalsValue = $('#generate_vocals .clickable-text-option.active').html();
    if (vocalsValue == 'Female Vocals' || vocalsValue == 'Male Vocals') {
      promptValues.push(vocalsValue);
    }

    if (vocalsValue == 'No Vocals (Instrumental)') {
      $('#ai_song_instrumental').val('true');
    } else {
      $('#ai_song_instrumental').val('false');
    }
  }

  $('#ai_song_prompt').val(promptValues.join(', '));
}

$(function() { onloadEvents(); });
document.addEventListener('turbo:load', function(e) { onloadEvents(); });

function onloadEvents() {
  $('#preview_img_container').css('height', $('#preview_img').outerHeight() + 2);

  $('#preview_img').on('load', function() {
    $('#preview_img_container').css('height', $(this).outerHeight() + 2);
  });

  $('#choose_library_song tr').click(function() {
    $('#choose_library_song input[type="radio"]').prop('checked', false);
    $(this).find('input[type="radio"]').prop('checked', true);
  });

  $('#collection_animation, #collection_image').click(function () {
    $('#collection_song_id_0').click();
  });

  $('#generate_genres .clickable-option').click(function() {
    $('#generate_genres .clickable-option').removeClass('active');
    $(this).addClass('active');

    let currentValue = $(this).find('span').html();

    let subgenreOptions = genresWithSubgenres[currentValue];
    let optionsContent = '';

    for (let i = 0; i < subgenreOptions.length; i++) {
      optionsContent += '<option value="' + subgenreOptions[i] + '">' + subgenreOptions[i] + '</option>';
    }

    $('#generate_subgenres').html(optionsContent).prop('disabled', false);

    let instrumentOptions = genresWithInstruments[currentValue];
    optionsContent = '';

    for (let i = 0; i < instrumentOptions.length; i++) {
      optionsContent += '<option value="' + instrumentOptions[i] + '">' + instrumentOptions[i] + '</option>';
    }

    $('#generate_instruments').html(optionsContent).prop('disabled', false);

    refreshPrompt();
  });

  $('#generate_moods .clickable-text-option').click(function() {
    $('#generate_moods .clickable-text-option').removeClass('active');
    $(this).addClass('active');

    refreshPrompt();
  });

  $('#generate_vocals .clickable-text-option').click(function() {
    $('#generate_vocals .clickable-text-option').removeClass('active');
    $(this).addClass('active');

    refreshPrompt();
  });

  $('#generate_subgenres').change(refreshPrompt);
  $('#generate_instruments').change(refreshPrompt);

  $(".datepicker").datepicker({
    dateFormat: 'DD, d MM, yy'
  });

  $('.timepicker').timepicker({
      timeFormat: 'HH:mm',
      interval: 30,
      minTime: '00:00',
      maxTime: '23:59',
      startTime: '00:00',
      dynamic: false,
      dropdown: true,
      scrollbar: true
  });
}
