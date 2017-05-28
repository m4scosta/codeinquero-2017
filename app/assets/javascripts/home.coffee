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
  points = $('#points')
  rewardedUser = $('#rewarded-user')
  description = $('#description')

  handleInputChange = (ev) ->
    if points.val() && rewardedUser.val() && description.val()
      submitBtn.removeClass('gray');
      submitBtn.addClass('green');
    else
      submitBtn.addClass('gray');
      submitBtn.removeClass('green');

  userRewardForm.find('[name]').on 'keyup', -> handleInputChange()

  userRewardForm.find('[name]').change -> handleInputChange()

  submitBtn.click (ev) ->
    if !(points.val() && rewardedUser.val() && description.val())
      ev.preventDefault()

  userRewardForm.on 'submit', (ev) ->
    ev.preventDefault()
    $.when(createUserReward(rewardedUser.val(), description.val(), points.val())).then(->
      location.reload()
    ).catch(->
      alert('erro')
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
