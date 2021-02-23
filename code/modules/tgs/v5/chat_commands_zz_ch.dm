/datum/tgs_chat_command/sharktest
	name = "flip"
	help_text = "babies first TGS command"
	admin_only = FALSE

/datum/tgs_chat_command/sharktest/Run(datum/tgs_chat_user/sender, params)
	var/x
	if(params != "tails" && params != "heads")
		return "```You need to guess!\n either heads or tails!```"
	if(prob(50))
		if(params == "tails")
			x = "correct"
		else
			x = "wrong"
		return "```Tails. [x]!```"

	if(params == "tails")
		x = "wrong"
	else
		x = "correct"
	return "```Heads. [x]!```"

/datum/tgs_chat_command/sharktest/alias
		name = "coin"

//modded fax code to properly handle non existing files before accessing the void
/datum/tgs_chat_command/readfax/Run(sender, params)
	var/list/all_params = splittext(params, " ")
	var/faxid = all_params[1]
	if(!all_params[1] || !fexists("[config.fax_export_dir]/fax_[faxid].html"))
		return "I’m sorry Dave, I’m afraid I can’t do that"
	var/faxmsg = return_file_text("[config.fax_export_dir]/fax_[faxid].html")
	return "FAX: ```[strip_html_properly(faxmsg)]```"