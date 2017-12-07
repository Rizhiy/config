# This is an alternative approach. Single line in git repo.
override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Custom"

  GIT_PROMPT_STAGED="${Green}● "
  GIT_PROMPT_CHANGED="${Red}✚ "

  GIT_PROMPT_COMMAND_OK="${BoldGreen}"
  GIT_PROMPT_COMMAND_FAIL="${BoldRed}"

  GIT_PROMPT_START_USER="${White}${Time12a}${ResetColor} ${BoldGreen}\u@\h:${BoldYellow}${PathShort}${ResetColor}"
  GIT_PROMPT_END_USER="_LAST_COMMAND_INDICATOR_ $ ${ResetColor}"
  GIT_PROMPT_END_ROOT="_LAST_COMMAND_INDICATOR_ # ${ResetColor}"
}

reload_git_prompt_colors "Custom"
