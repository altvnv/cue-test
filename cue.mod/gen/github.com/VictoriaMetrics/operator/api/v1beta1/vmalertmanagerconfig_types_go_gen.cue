// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/VictoriaMetrics/operator/api/v1beta1

package v1beta1

import (
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	apiextensionsv1 "k8s.io/apiextensions-apiserver/pkg/apis/apiextensions/v1"
	"k8s.io/api/core/v1"
)

// VMAlertmanagerConfigSpec defines configuration for VMAlertmanagerConfig
#VMAlertmanagerConfigSpec: {
	// Route definition for alertmanager, may include nested routes.
	// +optional
	route?: null | #Route @go(Route,*Route)

	// Receivers defines alert receivers.
	// without defined Route, receivers will be skipped.
	// +optional
	receivers?: [...#Receiver] @go(Receivers,[]Receiver)

	// InhibitRules will only apply for alerts matching
	// the resource's namespace.
	// +optional
	inhibit_rules?: [...#InhibitRule] @go(InhibitRules,[]InhibitRule)

	// MuteTimeInterval - global mute time
	// See https://prometheus.io/docs/alerting/latest/configuration/#mute_time_interval
	// +optional
	mute_time_intervals?: [...#MuteTimeInterval] @go(MutTimeIntervals,[]MuteTimeInterval)

	// ParsingError contents error with context if operator was failed to parse json object from kubernetes api server
	// TimeIntervals modern config option, use it instead of  mute_time_intervals
	// +optional
	time_intervals?: [...#MuteTimeInterval] @go(TimeIntervals,[]MuteTimeInterval)
}

// MuteTimeInterval for alerts
#MuteTimeInterval: {
	// Name of interval
	// +required
	name?: string @go(Name)

	// TimeIntervals interval configuration
	// +required
	time_intervals: [...#TimeInterval] @go(TimeIntervals,[]TimeInterval)
}

// TimeInterval defines intervals of time
#TimeInterval: {
	// Times defines time range for mute
	// +optional
	times?: [...#TimeRange] @go(Times,[]TimeRange)

	// Weekdays defines list of days of the week, where the week begins on Sunday and ends on Saturday.
	// +optional
	weekdays?: [...string] @go(Weekdays,[]string)

	// DayOfMonth defines list of numerical days in the month. Days begin at 1. Negative values are also accepted.
	// for example, ['1:5', '-3:-1']
	// +optional
	days_of_month?: [...string] @go(DaysOfMonth,[]string)

	// Months  defines list of calendar months identified by a case-insentive name (e.g. ‘January’) or numeric 1.
	// For example, ['1:3', 'may:august', 'december']
	// +optional
	months?: [...string] @go(Months,[]string)

	// Years defines numerical list of years, ranges are accepted.
	// For example, ['2020:2022', '2030']
	// +optional
	years?: [...string] @go(Years,[]string)

	// Location in golang time location form, e.g. UTC
	// +optional
	location?: string @go(Location)
}

// TimeRange  ranges inclusive of the starting time and exclusive of the end time
#TimeRange: {
	// StartTime for example  HH:MM
	// +required
	start_time: string @go(StartTime)

	// EndTime for example HH:MM
	// +required
	end_time: string @go(EndTime)
}

// VMAlertmanagerConfigStatus defines the observed state of VMAlertmanagerConfig
#VMAlertmanagerConfigStatus: {
	// ErrorReason describes validation or any other errors.
	reason?: string @go(ErrorReason)
}

// VMAlertmanagerConfig is the Schema for the vmalertmanagerconfigs API
// +kubebuilder:object:root=true
// +kubebuilder:subresource:status
// +genclient
// +k8s:openapi-gen=true
#VMAlertmanagerConfig: _

// VMAlertmanagerConfigList contains a list of VMAlertmanagerConfig
#VMAlertmanagerConfigList: {
	metav1.#TypeMeta
	metadata?: metav1.#ListMeta @go(ListMeta)
	items: [...#VMAlertmanagerConfig] @go(Items,[]VMAlertmanagerConfig)
}

// Route defines a node in the routing tree.
#Route: {
	// Name of the receiver for this route.
	// +required
	receiver: string @go(Receiver)

	// List of labels to group by.
	// +optional
	group_by?: [...string] @go(GroupBy,[]string)

	// How long to wait before sending the initial notification.
	// +kubebuilder:validation:Pattern:="[0-9]+(ms|s|m|h)"
	// +optional
	group_wait?: string @go(GroupWait)

	// How long to wait before sending an updated notification.
	// +kubebuilder:validation:Pattern:="[0-9]+(ms|s|m|h)"
	// +optional
	group_interval?: string @go(GroupInterval)

	// How long to wait before repeating the last notification.
	// +kubebuilder:validation:Pattern:="[0-9]+(ms|s|m|h)"
	// +optional
	repeat_interval?: string @go(RepeatInterval)

	// List of matchers that the alert’s labels should match. For the first
	// level route, the operator adds a namespace: "CRD_NS" matcher.
	// https://prometheus.io/docs/alerting/latest/configuration/#matcher
	// +optional
	matchers?: [...string] @go(Matchers,[]string)

	// Continue indicating whether an alert should continue matching subsequent
	// sibling nodes. It will always be true for the first-level route if disableRouteContinueEnforce for vmalertmanager not set.
	// +optional
	continue?: bool @go(Continue)

	// Child routes.
	// https://prometheus.io/docs/alerting/latest/configuration/#route
	routes?: [...apiextensionsv1.#JSON] @go(RawRoutes,[]apiextensionsv1.JSON)

	// MuteTimeIntervals for alerts
	// +optional
	mute_time_intervals?: [...string] @go(MuteTimeIntervals,[]string)

	// ActiveTimeIntervals Times when the route should be active
	// These must match the name at time_intervals
	// +optional
	active_time_intervals?: [...string] @go(ActiveTimeIntervals,[]string)
}

#SubRoute: #Route

// InhibitRule defines an inhibition rule that allows to mute alerts when other
// alerts are already firing.
// Note, it doesn't support deprecated alertmanager config options.
// See https://prometheus.io/docs/alerting/latest/configuration/#inhibit_rule
#InhibitRule: {
	// TargetMatchers defines a list of matchers that have to be fulfilled by the target
	// alerts to be muted.
	// +optional
	target_matchers?: [...string] @go(TargetMatchers,[]string)

	// SourceMatchers defines a list of matchers for which one or more alerts have
	// to exist for the inhibition to take effect.
	// +optional
	source_matchers?: [...string] @go(SourceMatchers,[]string)

	// Labels that must have an equal value in the source and target alert for
	// the inhibition to take effect.
	// +optional
	equal?: [...string] @go(Equal,[]string)
}

// Receiver defines one or more notification integrations.
#Receiver: {
	// Name of the receiver. Must be unique across all items from the list.
	// +kubebuilder:validation:MinLength=1
	// +required
	name: string @go(Name)

	// EmailConfigs defines email notification configurations.
	// +optional
	email_configs?: [...#EmailConfig] @go(EmailConfigs,[]EmailConfig)

	// PagerDutyConfigs defines pager duty notification configurations.
	// +optional
	pagerduty_configs?: [...#PagerDutyConfig] @go(PagerDutyConfigs,[]PagerDutyConfig)

	// PushoverConfigs defines push over notification configurations.
	// +optional
	pushover_configs?: [...#PushoverConfig] @go(PushoverConfigs,[]PushoverConfig)

	// SlackConfigs defines slack notification configurations.
	// +optional
	slack_configs?: [...#SlackConfig] @go(SlackConfigs,[]SlackConfig)

	// OpsGenieConfigs defines ops genie notification configurations.
	// +optional
	opsgenie_configs?: [...#OpsGenieConfig] @go(OpsGenieConfigs,[]OpsGenieConfig)

	// WebhookConfigs defines webhook notification configurations.
	// +optional
	webhook_configs?: [...#WebhookConfig] @go(WebhookConfigs,[]WebhookConfig)

	// VictorOpsConfigs defines victor ops notification configurations.
	// +optional
	victorops_configs?: [...#VictorOpsConfig] @go(VictorOpsConfigs,[]VictorOpsConfig)

	// WeChatConfigs defines wechat notification configurations.
	// +optional
	wechat_configs?: [...#WeChatConfig] @go(WeChatConfigs,[]WeChatConfig)

	// +optional
	telegram_configs?: [...#TelegramConfig] @go(TelegramConfigs,[]TelegramConfig)

	// +optional
	msteams_configs?: [...#MSTeamsConfig] @go(MSTeamsConfigs,[]MSTeamsConfig)

	// +optional
	discord_configs?: [...#DiscordConfig] @go(DiscordConfigs,[]DiscordConfig)

	// +optional
	sns_configs?: [...#SnsConfig] @go(SNSConfigs,[]SnsConfig)

	// +optional
	webex_configs?: [...#WebexConfig] @go(WebexConfigs,[]WebexConfig)
}

#TelegramConfig: {
	// SendResolved controls notify about resolved alerts.
	// +optional
	send_resolved?: null | bool @go(SendResolved,*bool)

	// APIUrl the Telegram API URL i.e. https://api.telegram.org.
	// +optional
	api_url?: string @go(APIUrl)

	// BotToken token for the bot
	// https://core.telegram.org/bots/api
	bot_token?: null | v1.#SecretKeySelector @go(BotToken,*v1.SecretKeySelector)

	// ChatID is ID of the chat where to send the messages.
	chat_id: int @go(ChatID)

	// Message is templated message
	// +optional
	message?: string @go(Message)

	// DisableNotifications
	// +optional
	disable_notifications?: null | bool @go(DisableNotifications,*bool)

	// ParseMode for telegram message,
	// supported values are MarkdownV2, Markdown, Markdown and empty string for plain text.
	// +optional
	parse_mode?: string @go(ParseMode)

	// HTTP client configuration.
	// +optional
	http_config?: null | #HTTPConfig @go(HTTPConfig,*HTTPConfig)
}

// WebhookConfig configures notifications via a generic receiver supporting the webhook payload.
// See https://prometheus.io/docs/alerting/latest/configuration/#webhook_config
#WebhookConfig: {
	// SendResolved controls notify about resolved alerts.
	// +optional
	send_resolved?: null | bool @go(SendResolved,*bool)

	// URL to send requests to,
	// one of `urlSecret` and `url` must be defined.
	// +optional
	url?: null | string @go(URL,*string)

	// URLSecret defines secret name and key at the CRD namespace.
	// It must contain the webhook URL.
	// one of `urlSecret` and `url` must be defined.
	// +optional
	url_secret?: null | v1.#SecretKeySelector @go(URLSecret,*v1.SecretKeySelector)

	// HTTP client configuration.
	// +optional
	http_config?: null | #HTTPConfig @go(HTTPConfig,*HTTPConfig)

	// Maximum number of alerts to be sent per webhook message. When 0, all alerts are included.
	// +optional
	// +kubebuilder:validation:Minimum=0
	max_alerts?: int32 @go(MaxAlerts)
}

// WeChatConfig configures notifications via WeChat.
// See https://prometheus.io/docs/alerting/latest/configuration/#wechat_config
#WeChatConfig: {
	// SendResolved controls notify about resolved alerts.
	// +optional
	send_resolved?: null | bool @go(SendResolved,*bool)

	// The secret's key that contains the WeChat API key.
	// The secret needs to be in the same namespace as the AlertmanagerConfig
	// object and accessible by the Prometheus Operator.
	// +optional
	api_secret?: null | v1.#SecretKeySelector @go(APISecret,*v1.SecretKeySelector)

	// The WeChat API URL.
	// +optional
	api_url?: string @go(APIURL)

	// The corp id for authentication.
	// +optional
	corp_id?: string @go(CorpID)

	// +optional
	agent_id?: string @go(AgentID)

	// +optional
	to_user?: string @go(ToUser)

	// +optional
	to_party?: string @go(ToParty)

	// +optional
	to_tag?: string @go(ToTag)

	// API request data as defined by the WeChat API.
	message?: string @go(Message)

	// +optional
	message_type?: string @go(MessageType)

	// HTTP client configuration.
	// +optional
	http_config?: null | #HTTPConfig @go(HTTPConfig,*HTTPConfig)
}

// EmailConfig configures notifications via Email.
#EmailConfig: {
	// SendResolved controls notify about resolved alerts.
	// +optional
	send_resolved?: null | bool @go(SendResolved,*bool)

	// The email address to send notifications to.
	// +optional
	to?: string @go(To)

	// The sender address.
	// +optional
	from?: string @go(From)

	// The hostname to identify to the SMTP server.
	// +optional
	hello?: string @go(Hello)

	// The SMTP host through which emails are sent.
	// +optional
	smarthost?: string @go(Smarthost)

	// The username to use for authentication.
	// +optional
	auth_username?: string @go(AuthUsername)

	// AuthPassword defines secret name and key at CRD namespace.
	// +optional
	auth_password?: null | v1.#SecretKeySelector @go(AuthPassword,*v1.SecretKeySelector)

	// AuthSecret defines secrent name and key at CRD namespace.
	// It must contain the CRAM-MD5 secret.
	// +optional
	auth_secret?: null | v1.#SecretKeySelector @go(AuthSecret,*v1.SecretKeySelector)

	// The identity to use for authentication.
	// +optional
	auth_identity?: string @go(AuthIdentity)

	// Further headers email header key/value pairs. Overrides any headers
	// previously set by the notification implementation.
	headers?: #EmailConfigHeaders @go(Headers)

	// The HTML body of the email notification.
	// +optional
	html?: string @go(HTML)

	// The text body of the email notification.
	// +optional
	text?: string @go(Text)

	// The SMTP TLS requirement.
	// Note that Go does not support unencrypted connections to remote SMTP endpoints.
	// +optional
	require_tls?: null | bool @go(RequireTLS,*bool)

	// TLS configuration
	// +optional
	tls_config?: null | #TLSConfig @go(TLSConfig,*TLSConfig)
}

// EmailConfigHeaders is a map of email headers.
#EmailConfigHeaders: _

// VictorOpsConfig configures notifications via VictorOps.
// See https://prometheus.io/docs/alerting/latest/configuration/#victorops_config
#VictorOpsConfig: {
	// SendResolved controls notify about resolved alerts.
	// +optional
	send_resolved?: null | bool @go(SendResolved,*bool)

	// The secret's key that contains the API key to use when talking to the VictorOps API.
	// It must be at them same namespace as CRD
	// +optional
	api_key?: null | v1.#SecretKeySelector @go(APIKey,*v1.SecretKeySelector)

	// The VictorOps API URL.
	// +optional
	api_url?: string @go(APIURL)

	// A key used to map the alert to a team.
	// +optional
	routing_key?: string @go(RoutingKey)

	// Describes the behavior of the alert (CRITICAL, WARNING, INFO).
	// +optional
	message_type?: string @go(MessageType)

	// Contains summary of the alerted problem.
	// +optional
	entity_display_name?: string @go(EntityDisplayName)

	// Contains long explanation of the alerted problem.
	// +optional
	state_message?: string @go(StateMessage)

	// The monitoring tool the state message is from.
	// +optional
	monitoring_tool?: string @go(MonitoringTool)

	// The HTTP client's configuration.
	// +optional
	http_config?: null | #HTTPConfig @go(HTTPConfig,*HTTPConfig)

	// Adds optional custom fields
	// https://github.com/prometheus/alertmanager/blob/v0.24.0/config/notifiers.go#L537
	// +optional
	custom_fields?: {[string]: string} @go(CustomFields,map[string]string)
}

// PushoverConfig configures notifications via Pushover.
// See https://prometheus.io/docs/alerting/latest/configuration/#pushover_config
#PushoverConfig: {
	// SendResolved controls notify about resolved alerts.
	// +optional
	send_resolved?: null | bool @go(SendResolved,*bool)

	// The secret's key that contains the recipient user’s user key.
	// It must be at them same namespace as CRD
	user_key?: null | v1.#SecretKeySelector @go(UserKey,*v1.SecretKeySelector)

	// The secret's key that contains the registered application’s API token, see https://pushover.net/apps.
	// It must be at them same namespace as CRD
	token?: null | v1.#SecretKeySelector @go(Token,*v1.SecretKeySelector)

	// Notification title.
	// +optional
	title?: string @go(Title)

	// Notification message.
	// +optional
	message?: string @go(Message)

	// A supplementary URL shown alongside the message.
	// +optional
	url?: string @go(URL)

	// A title for supplementary URL, otherwise just the URL is shown
	// +optional
	url_title?: string @go(URLTitle)

	// The name of one of the sounds supported by device clients to override the user's default sound choice
	// +optional
	sound?: string @go(Sound)

	// Priority, see https://pushover.net/api#priority
	// +optional
	priority?: string @go(Priority)

	// How often the Pushover servers will send the same notification to the user.
	// Must be at least 30 seconds.
	// +optional
	retry?: string @go(Retry)

	// How long your notification will continue to be retried for, unless the user
	// acknowledges the notification.
	// +optional
	expire?: string @go(Expire)

	// Whether notification message is HTML or plain text.
	// +optional
	html?: bool @go(HTML)

	// HTTP client configuration.
	// +optional
	http_config?: null | #HTTPConfig @go(HTTPConfig,*HTTPConfig)
}

// SlackConfig configures notifications via Slack.
// See https://prometheus.io/docs/alerting/latest/configuration/#slack_config
#SlackConfig: {
	// SendResolved controls notify about resolved alerts.
	// +optional
	send_resolved?: null | bool @go(SendResolved,*bool)

	// The secret's key that contains the Slack webhook URL.
	// It must be at them same namespace as CRD
	// +optional
	api_url?: null | v1.#SecretKeySelector @go(APIURL,*v1.SecretKeySelector)

	// The channel or user to send notifications to.
	// +optional
	channel?: string @go(Channel)

	// +optional
	username?: string @go(Username)

	// +optional
	color?: string @go(Color)

	// +optional
	title?: string @go(Title)

	// +optional
	title_link?: string @go(TitleLink)

	// +optional
	pretext?: string @go(Pretext)

	// +optional
	text?: string @go(Text)

	// A list of Slack fields that are sent with each notification.
	// +optional
	fields?: [...#SlackField] @go(Fields,[]SlackField)

	// +optional
	short_fields?: bool @go(ShortFields)

	// +optional
	footer?: string @go(Footer)

	// +optional
	fallback?: string @go(Fallback)

	// +optional
	callback_id?: string @go(CallbackID)

	// +optional
	icon_emoji?: string @go(IconEmoji)

	// +optional
	icon_url?: string @go(IconURL)

	// +optional
	image_url?: string @go(ImageURL)

	// +optional
	thumb_url?: string @go(ThumbURL)

	// +optional
	link_names?: bool @go(LinkNames)

	// +optional
	mrkdwn_in?: [...string] @go(MrkdwnIn,[]string)

	// A list of Slack actions that are sent with each notification.
	// +optional
	actions?: [...#SlackAction] @go(Actions,[]SlackAction)

	// HTTP client configuration.
	// +optional
	http_config?: null | #HTTPConfig @go(HTTPConfig,*HTTPConfig)
}

// SlackField configures a single Slack field that is sent with each notification.
// See https://api.slack.com/docs/message-attachments#fields for more information.
#SlackField: {
	// +kubebuilder:validation:MinLength=1
	// +required
	title: string @go(Title)

	// +kubebuilder:validation:MinLength=1
	// +required
	value: string @go(Value)

	// +optional
	short?: null | bool @go(Short,*bool)
}

// SlackAction configures a single Slack action that is sent with each
// notification.
// See https://api.slack.com/docs/message-attachments#action_fields and
// https://api.slack.com/docs/message-buttons for more information.
#SlackAction: {
	// +kubebuilder:validation:MinLength=1
	// +required
	type: string @go(Type)

	// +kubebuilder:validation:MinLength=1
	// +required
	text: string @go(Text)

	// +optional
	url?: string @go(URL)

	// +optional
	style?: string @go(Style)

	// +optional
	name?: string @go(Name)

	// +optional
	value?: string @go(Value)

	// +optional
	confirm?: null | #SlackConfirmationField @go(ConfirmField,*SlackConfirmationField)
}

// SlackConfirmationField protect users from destructive actions or
// particularly distinguished decisions by asking them to confirm their button
// click one more time.
// See https://api.slack.com/docs/interactive-message-field-guide#confirmation_fields
// for more information.
#SlackConfirmationField: {
	// +kubebuilder:validation:MinLength=1
	// +required
	text: string @go(Text)

	// +optional
	title?: string @go(Title)

	// +optional
	ok_text?: string @go(OkText)

	// +optional
	dismiss_text?: string @go(DismissText)
}

// OpsGenieConfig configures notifications via OpsGenie.
// See https://prometheus.io/docs/alerting/latest/configuration/#opsgenie_config
#OpsGenieConfig: {
	// SendResolved controls notify about resolved alerts.
	// +optional
	send_resolved?: null | bool @go(SendResolved,*bool)

	// The secret's key that contains the OpsGenie API key.
	// It must be at them same namespace as CRD
	// +optional
	api_key?: null | v1.#SecretKeySelector @go(APIKey,*v1.SecretKeySelector)

	// The URL to send OpsGenie API requests to.
	// +optional
	apiURL?: string @go(APIURL)

	// Alert text limited to 130 characters.
	// +optional
	message?: string @go(Message)

	// Description of the incident.
	// +optional
	description?: string @go(Description)

	// Backlink to the sender of the notification.
	// +optional
	source?: string @go(Source)

	// Comma separated list of tags attached to the notifications.
	// +optional
	tags?: string @go(Tags)

	// Additional alert note.
	// +optional
	note?: string @go(Note)

	// Priority level of alert. Possible values are P1, P2, P3, P4, and P5.
	// +optional
	priority?: string @go(Priority)

	// A set of arbitrary key/value pairs that provide further detail about the incident.
	// +optional
	details?: {[string]: string} @go(Details,map[string]string)

	// List of responders responsible for notifications.
	// +optional
	responders?: [...#OpsGenieConfigResponder] @go(Responders,[]OpsGenieConfigResponder)

	// Optional field that can be used to specify which domain alert is related to.
	entity?: string @go(Entity)

	// Comma separated list of actions that will be available for the alert.
	actions?: string @go(Actions)

	// Whether to update message and description of the alert in OpsGenie if it already exists
	// By default, the alert is never updated in OpsGenie, the new message only appears in activity log.
	update_alerts?: bool @go(UpdateAlerts)

	// HTTP client configuration.
	// +optional
	http_config?: null | #HTTPConfig @go(HTTPConfig,*HTTPConfig)
}

// OpsGenieConfigResponder defines a responder to an incident.
// One of `id`, `name` or `username` has to be defined.
#OpsGenieConfigResponder: {
	// ID of the responder.
	// +optional
	id?: string @go(ID)

	// Name of the responder.
	// +optional
	name?: string @go(Name)

	// Username of the responder.
	// +optional
	username?: string @go(Username)

	// Type of responder.
	// +kubebuilder:validation:MinLength=1
	// +required
	type: string @go(Type)
}

// PagerDutyConfig configures notifications via PagerDuty.
// See https://prometheus.io/docs/alerting/latest/configuration/#pagerduty_config
#PagerDutyConfig: {
	// SendResolved controls notify about resolved alerts.
	// +optional
	send_resolved?: null | bool @go(SendResolved,*bool)

	// The secret's key that contains the PagerDuty integration key (when using
	// Events API v2). Either this field or `serviceKey` needs to be defined.
	// It must be at them same namespace as CRD
	// +optional
	routing_key?: null | v1.#SecretKeySelector @go(RoutingKey,*v1.SecretKeySelector)

	// The secret's key that contains the PagerDuty service key (when using
	// integration type "Prometheus"). Either this field or `routingKey` needs to
	// be defined.
	// It must be at them same namespace as CRD
	// +optional
	service_key?: null | v1.#SecretKeySelector @go(ServiceKey,*v1.SecretKeySelector)

	// The URL to send requests to.
	// +optional
	url?: string @go(URL)

	// Client identification.
	// +optional
	client?: string @go(Client)

	// Backlink to the sender of notification.
	// +optional
	client_url?: string @go(ClientURL)

	// Images to attach to the incident.
	// +optional
	images?: [...#ImageConfig] @go(Images,[]ImageConfig)

	// Links to attach to the incident.
	// +optional
	links?: [...#LinkConfig] @go(Links,[]LinkConfig)

	// Description of the incident.
	// +optional
	description?: string @go(Description)

	// Severity of the incident.
	// +optional
	severity?: string @go(Severity)

	// The class/type of the event.
	// +optional
	class?: string @go(Class)

	// A cluster or grouping of sources.
	// +optional
	group?: string @go(Group)

	// The part or component of the affected system that is broken.
	// +optional
	component?: string @go(Component)

	// Arbitrary key/value pairs that provide further detail about the incident.
	// +optional
	details?: #PagerDutyDetails @go(Details)

	// HTTP client configuration.
	// +optional
	http_config?: null | #HTTPConfig @go(HTTPConfig,*HTTPConfig)
}

// PagerDutyDetails details for config
#PagerDutyDetails: _

// ImageConfig is used to attach images to the incident.
// See https://developer.pagerduty.com/docs/ZG9jOjExMDI5NTgx-send-an-alert-event#the-images-property
// for more information.
#ImageConfig: {
	href?:  string @go(Href)
	source: string @go(Source)
	alt?:   string @go(Alt)
}

// LinkConfig is used to attach text links to the incident.
// See https://developer.pagerduty.com/docs/ZG9jOjExMDI5NTgx-send-an-alert-event#the-links-property
// for more information.
#LinkConfig: {
	href:  string @go(Href)
	text?: string @go(Text)
}

#MSTeamsConfig: {
	// SendResolved controls notify about resolved alerts.
	// +optional
	send_resolved?: null | bool @go(SendResolved,*bool)

	// The incoming webhook URL
	// one of `urlSecret` and `url` must be defined.
	// +optional
	webhook_url?: null | string @go(URL,*string)

	// URLSecret defines secret name and key at the CRD namespace.
	// It must contain the webhook URL.
	// one of `urlSecret` and `url` must be defined.
	// +optional
	webhook_url_secret?: null | v1.#SecretKeySelector @go(URLSecret,*v1.SecretKeySelector)

	// The title of the teams notification.
	// +optional
	title?: string @go(Title)

	// The text body of the teams notification.
	// +optional
	text?: string @go(Text)

	// HTTP client configuration.
	// +optional
	http_config?: null | #HTTPConfig @go(HTTPConfig,*HTTPConfig)
}

#DiscordConfig: {
	// SendResolved controls notify about resolved alerts.
	// +optional
	send_resolved?: null | bool @go(SendResolved,*bool)

	// The discord webhook URL
	// one of `urlSecret` and `url` must be defined.
	// +optional
	webhook_url?: null | string @go(URL,*string)

	// URLSecret defines secret name and key at the CRD namespace.
	// It must contain the webhook URL.
	// one of `urlSecret` and `url` must be defined.
	// +optional
	webhook_url_secret?: null | v1.#SecretKeySelector @go(URLSecret,*v1.SecretKeySelector)

	// The message title template
	// +optional
	title?: string @go(Title)

	// The message body template
	// +optional
	message?: string @go(Message)

	// HTTP client configuration.
	// +optional
	http_config?: null | #HTTPConfig @go(HTTPConfig,*HTTPConfig)
}

#SnsConfig: {
	// SendResolved controls notify about resolved alerts.
	// +optional
	send_resolved?: null | bool @go(SendResolved,*bool)

	// The api URL
	// +optional
	api_url?: string @go(URL)

	// Configure the AWS Signature Verification 4 signing process
	sigv4?: null | #Sigv4Config @go(Sigv4,*Sigv4Config)

	// SNS topic ARN, either specify this, phone_number or target_arn
	// +optional
	topic_arn?: string @go(TopicArn)

	// The subject line if message is delivered to an email endpoint.
	// +optional
	subject?: string @go(Subject)

	// Phone number if message is delivered via SMS
	// Specify this, topic_arn or target_arn
	phone_number?: string @go(PhoneNumber)

	// Mobile platform endpoint ARN if message is delivered via mobile notifications
	// Specify this, topic_arn or phone_number
	// +optional
	target_arn?: string @go(TargetArn)

	// The message content of the SNS notification.
	// +optional
	message?: string @go(Message)

	// SNS message attributes
	// +optional
	attributes?: {[string]: string} @go(Attributes,map[string]string)

	// HTTP client configuration.
	// +optional
	http_config?: null | #HTTPConfig @go(HTTPConfig,*HTTPConfig)
}

#Sigv4Config: {
	// AWS region, if blank the region from the default credentials chain is used
	// +optional
	region?: string @go(Region)

	// The AWS API keys. Both access_key and secret_key must be supplied or both must be blank.
	// If blank the environment variables `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are used.
	// +optional
	access_key?: string @go(AccessKey)

	// secret key selector to get the keys from a Kubernetes Secret
	// +optional
	access_key_selector?: null | v1.#SecretKeySelector @go(AccessKeySelector,*v1.SecretKeySelector)

	// secret key selector to get the keys from a Kubernetes Secret
	// +optional
	secret_key_selector?: null | v1.#SecretKeySelector @go(SecretKey,*v1.SecretKeySelector)

	// Named AWS profile used to authenticate
	// +optional
	profile?: string @go(Profile)

	// AWS Role ARN, an alternative to using AWS API keys
	// +optional
	role_arn?: string @go(RoleArn)
}

#WebexConfig: {
	// SendResolved controls notify about resolved alerts.
	// +optional
	send_resolved?: null | bool @go(SendResolved,*bool)

	// The Webex Teams API URL, i.e. https://webexapis.com/v1/messages
	// +optional
	api_url?: null | string @go(URL,*string)

	// The ID of the Webex Teams room where to send the messages
	// +required
	room_id?: string @go(RoomId)

	// The message body template
	// +optional
	message?: string @go(Message)

	// HTTP client configuration. You must use this configuration to supply the bot token as part of the HTTP `Authorization` header. 
	// +optional
	http_config?: null | #HTTPConfig @go(HTTPConfig,*HTTPConfig)
}

// HTTPConfig defines a client HTTP configuration.
// See https://prometheus.io/docs/alerting/latest/configuration/#http_config
#HTTPConfig: {
	// TODO oAuth2 support
	// BasicAuth for the client.
	// +optional
	basic_auth?: null | #BasicAuth @go(BasicAuth,*BasicAuth)

	// The secret's key that contains the bearer token
	// It must be at them same namespace as CRD
	// +optional
	bearer_token_secret?: null | v1.#SecretKeySelector @go(BearerTokenSecret,*v1.SecretKeySelector)

	// BearerTokenFile defines filename for bearer token, it must be mounted to pod.
	// +optional
	bearer_token_file?: string @go(BearerTokenFile)

	// TLS configuration for the client.
	// +optional
	tls_config?: null | #TLSConfig @go(TLSConfig,*TLSConfig)

	// Optional proxy URL.
	// +optional
	proxyURL?: string @go(ProxyURL)
}
