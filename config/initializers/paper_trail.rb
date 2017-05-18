PaperTrail.enabled = %w[1 true].include?(ENV['PAPER_TRAIL_ENABLED'])
PaperTrail.config.track_associations = false
