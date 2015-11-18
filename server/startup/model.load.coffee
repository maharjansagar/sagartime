Meteor.startup ->
  process.env.MAIL_URL="smtp://mist3st.zzz%40gmail.com:testaccount@smtp.gmail.com:587/"
  Accounts.emailTemplates.verifyEmail.text = (user, url) ->
    url = url.replace('#/','')