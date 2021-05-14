var CONFIG = {
  "lang": "fa",
  "supportedLangs": ["fa", "en"]
};

function localize(language) {
  if ($.inArray(language, CONFIG.supportedLangs) >= 0) {
    let lang = ':lang(' + language + ')';
    let hide = '[lang]:not(' + lang + ')';
    document.querySelectorAll(hide).forEach(function(node) {
      node.style.display = 'none';
    });
    let show = '[lang]' + lang;
    document.querySelectorAll(show).forEach(function(node) {
      node.style.display = 'unset';
    });
  }
}

function update(save) {
  $.post('http://skincreator/updateSkin', JSON.stringify({
    value: save,
    // Face
    dad: $('input[name=pere]:checked', '#formSkinCreator').val(),
    mum: $('input[name=mere]:checked', '#formSkinCreator').val(),
    gender: $('input[name=gender]:checked', '#formSkinCreator').val(),
    eyecolor: $('input[name=eyecolor]:checked', '#formSkinCreator').val(),
    acne: $('.acne').val(),
    skinproblem: $('.pbpeau').val(),
    freckle: $('.tachesrousseur').val(),
    wrinkle: $('.rides').val(),
    wrinkleopacity: $('.rides').val(),
    hair: $('.hair').val(),
    haircolor: $('input[name=haircolor]:checked', '#formSkinCreator').val(),
    eyebrow: $('.sourcils').val(),
    eyebrowopacity: $('.epaisseursourcils').val(),
    beard: $('.barbe').val(),
    beardopacity: $('.epaisseurbarbe').val(),
    beardcolor: $('input[name=barbecolor]:checked', '#formSkinCreator').val(),
    // Clothes
    hats: $('.chapeaux .active').attr('data'),
    hats_texture: $('input[class=helmet_2]').val(),
    glasses: $('.lunettes .active').attr('data'),
    glasses_texture: $('input[class=glasses_2]').val(),
    ears: $('.oreilles .active').attr('data'),
    ears_texture: $('input[class=ears_2]').val(),
	
    tshirts_1: $('.hauts .active').attr('data'),
    tshirts_2: $('input[class=tshirts_2]').val(),
	
    torso_1: $('.torso_1 .active').attr('data'),
    torso_2: $('input[class=torso_2]').val(),
	
    arms_1: $('.arms_1 .active').attr('data'),
    arms_2: $('input[class=arms_2]').val(),
	
    shapeMix: $('input[class=shapeMix]').val(),
    skinMix: $('input[class=skinMix]').val(),
	
    nose_1: $('input[class=nose_1]').val(),
    nose_2: $('input[class=nose_2]').val(),
    nose_3: $('input[class=nose_3]').val(),
    nose_4: $('input[class=nose_4]').val(),
    nose_5: $('input[class=nose_5]').val(),
    nose_6: $('input[class=nose_6]').val(),
    eyebrows_5: $('input[class=eyebrows_5]').val(),
    eyebrows_6: $('input[class=eyebrows_6]').val(),
    cheeks_1: $('input[class=cheeks_1]').val(),
    cheeks_2: $('input[class=cheeks_2]').val(),
    cheeks_3: $('input[class=cheeks_3]').val(),
    eye_open: $('input[class=eye_open]').val(),
    lips_thick: $('input[class=lips_thick]').val(),
    jaw_1: $('input[class=jaw_1]').val(),
    jaw_2: $('input[class=jaw_2]').val(),
    chin_height: $('input[class=chin_height]').val(),
    chin_lenght: $('input[class=chin_lenght]').val(),
    chin_width: $('input[class=chin_width]').val(),
    chin_hole: $('input[class=chin_hole]').val(),
    neck_thick: $('input[class=neck_thick]').val(),
	
    pants: $('.pantalons .active').attr('data'),
    pants_texture: $('input[class=pantalons_2]').val(),
    shoes: $('.chaussures .active').attr('data'),
    shoes_texture: $('input[class=chaussures_2]').val(),
    watches: $('.montre .active').attr('data'),
    watches_texture: $('input[class=montre_2]').val(),
  }))
}

$(document).ready(function() {
  localize(CONFIG.lang);
  // Listen for NUI Events
  window.addEventListener('message', function(event) {
    // Open Skin Creator
    if (event.data.openSkinCreator == true) {
      $(".skinCreator").css("display", "block");
      $(".rotation").css("display", "flex");
    }
    // Close Skin Creator
    if (event.data.openSkinCreator == false) {
      $(".skinCreator").fadeOut(400);
      $(".rotation").css("display", "none");
    }
    // Click
    if (event.data.type == "updateMaxVal") {
      $('input.' + event.data.classname).prop('max', event.data.maxVal);
      $('input.' + event.data.classname).val(event.data.defaultVal);
      $('div[name=' + event.data.classname + ']').attr('data-legend', event.data.maxVal);
      $('div[name=' + event.data.classname + ']').text(event.data.defaultVal + '/' + event.data.maxVal);
    }
  });

  // Form update
  $('input').change(function() {
    update(false);
  });
  $('.arrow').on('click', function(e) {
    e.preventDefault();
    update(false);
  });

  // Form submited
  $('.yes').on('click', function(e) {
    e.preventDefault();
    update(true);
  });
  // Rotate player
  $(document).keypress(function(e) {
    if (e.which == 97) { // A pressed
      $.post('http://skincreator/rotaterightheading', JSON.stringify({
        value: 10
      }));
    }
    if (e.which == 100) { // D pressed
      $.post('http://skincreator/rotateleftheading', JSON.stringify({
        value: 10
      }));
    }
  });

  // Zoom out camera for clothes
  $('#tabs label').on('click', function(e) {
    //e.preventDefault();
    $.post('http://skincreator/zoom', JSON.stringify({
      zoom: $(this).attr('data-link')
    }));
  });

  $('.oreilles li').on('click', function(e) {
    $.post('http://skincreator/zoom', JSON.stringify({
      zoom: 'oreilles'
    }));
  });
});