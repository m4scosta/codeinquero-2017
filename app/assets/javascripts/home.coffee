$ ->
  USER_REWARD_URL = '/user_rewards'
  QUEST_REWARD_URL = '/quest_rewards'
  QUEST_URL = '/quests'

  postJSON = (url, data) ->
    $.ajax
      url: url
      data: data
      type: 'POST'
      dataType: 'json'

  createUserReward = (to_user_id, description, points) ->
    data = { to_user_id: to_user_id, description: description, points: points }
    postJSON(USER_REWARD_URL, data)

  createQuest = (icon, description, reward_points, max_participants) ->
    data = {
      icon: icon, description: description,
      reward_points: reward_points, max_participants: max_participants
    }
    postJSON(QUEST_URL, data)

  createQuestReward = (to_user_id, quest_id) ->
    data = { to_user_id: to_user_id, quest_id: quest_id }
    postJSON(QUEST_REWARD_URL, data)

  submitBtn = $('#submit-btn')
  userRewardForm = $('#user-reward-form')
  description = $('#description')
  data = {}

  questForm = $('#quest-form')
  questDescription = $('#quest-description')
  questMaxParticipants = $('#quest-max-participants')

  $('.itemSelect').click ->
    $(this).children().toggleClass('active');

  $('.itemSelect .itemList li').click ->
    value = $(this).attr('data-value')
    name = $(this).attr('data-name')
    label = $(this).attr('data-label')

    data[name] = value

    $(this).closest('.itemSelect').children('span').html(label)
    $(this).closest('.itemSelect').children('span').addClass('selected')
    handleInputChange()

  handleInputChange = (ev) ->
    data['description'] = description.val()
    data['quest_description'] = questDescription.val()
    data['quest_max_participants'] = questMaxParticipants.val()

    if data['description'] && data['points'] && data['rewarded_user']
      submitBtn.removeClass('gray');
      submitBtn.addClass('green');
    else
      submitBtn.addClass('gray');
      submitBtn.removeClass('green');

    if data['quest_description'] && data['quest_max_participants'] && data['quest_points']
      $('#quest-submit').removeClass('gray');
      $('#quest-submit').addClass('green');
    else
      $('#quest-submit').addClass('gray');
      $('#quest-submit').removeClass('green');


  $('[name]').on 'keyup', -> handleInputChange()

  submitBtn.click (ev) ->
    if !(data['description'] && data['points'] && data['rewarded_user'])
      ev.preventDefault()

  userRewardForm.on 'submit', (ev) ->
    ev.preventDefault()
    $.when(createUserReward(data['rewarded_user'], data['description'], data['points'])).then(->
      location.reload()
    )

  questForm.on 'submit', (ev) ->
    ev.preventDefault()
    if data['quest_description'] && data['quest_max_participants'] && data['quest_points']
      $.when(createQuest('test.ico', data['quest_description'], data['quest_points'], data['quest_max_participants'])).then(->
        location.reload()
      )



  # $.when(createUserReward(1, 'test213123', 1)).then(->
  #   console.log 'ok'
  #   $.when(createQuest('test.ico', 'description test', 1, 10)).then(->
  #     console.log 'ok'
  #     $.when(createQuestReward(1, 6)).then(->
  #       console.log 'ok'
  #     )
  #   )
  # )
