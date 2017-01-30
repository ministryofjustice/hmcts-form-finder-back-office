module HostEnv
  extend self

  def is_live?
    ENV['SENDING_HOST'] =~ /hmctsformfinderbackoffice-production.tacticalproductshmcts.dsd.io/
  end

  def is_staging?
   ENV['SENDING_HOST'] =~ /hmctsformfinderbackoffice-staging.tacticalproductshmcts.dsd.io/
  end

  def is_dev?
    ENV['SENDING_HOST'] =~ /hmctsformfinderbackoffice-dev.tacticalproductshmcts.dsd.io/
  end
end