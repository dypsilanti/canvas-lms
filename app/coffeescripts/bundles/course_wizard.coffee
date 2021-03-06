require [
  'jquery'
  'react'
  'compiled/userSettings'
  'jsx/course_wizard/CourseWizard'
], ($, React, userSettings, CourseWizard) ->

  ###
  # This essentially handles binding the button events and calling out to the
  # CourseWizard React component that is the actual wizard.
  ###

  $wizard_box = $("#wizard_box")

  pathname = window.location.pathname

  $(".wizard_popup_link").click((event) ->
      React.renderComponent(CourseWizard({
        overlayClassName:'CourseWizard__modalOverlay',
        showWizard: true
      }), $wizard_box[0])
  )

  setTimeout( ->
    if (!userSettings.get('hide_wizard_' + pathname))
      $(".wizard_popup_link.auto_open:first").click()
  , 500)