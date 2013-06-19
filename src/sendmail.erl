-module(sendmail).

-export([ create/4
        , create/5
        , send/4
        , send/5
        , post/4
        , post/5
        , send_data/3
        , send_data/4
        ]).

-define(SERVER, sendmail_server).

create(To, From, Subject, Message) ->
    create(To, From, Subject, Message, []).

create(To, From, Subject, Message, Opts) ->
    gen_server:call(?SERVER, {create, To, From, Subject, Message, Opts}).

send(To, From, Subject, Message) ->
    send(To, From, Subject, Message, []).

send(To, From, Subject, Message, Opts) ->
    gen_server:call(?SERVER, {send, To, From, Subject, Message, Opts}).

post(To, From, Subject, Message) ->
    post(To, From, Subject, Message, []).

post(To, From, Subject, Message, Opts) ->
    gen_server:cast(?SERVER, {send, To, From, Subject, Message, Opts}).

%% returns {ExitCode, CmdOutput}
send_data(To, From, Data, Opts) ->
    %% should perhaps support other methods as well, such as direct SMTP
    %% (in that case, this module should probably be renamed)
    gen_server:call(?SERVER, {send_data, From, To, Data, Opts}).

%% returns {ExitCode, CmdOutput}
send_data(From, Data, Opts) ->
    gen_server:call(?SERVER, {send_data, From, Data, Opts}).
