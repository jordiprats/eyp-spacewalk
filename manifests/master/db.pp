class spacewalk::master::db() inherits spacewalk {

  class { 'postgresql':
		wal_level => 'hot_standby',
		max_wal_senders => '3',
		checkpoint_segments => '8',
		wal_keep_segments => '8',
	}

}
