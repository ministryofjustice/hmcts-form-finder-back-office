module HostEnv
  module_function

  def live?
    ENV['SENDING_HOST'] =~ /hmctsformfinderbackoffice-prod.tacticalproductshmcts.dsd.io/
  end

  def staging?
    ENV['SENDING_HOST'] =~ /hmctsformfinderbackoffice-staging.tacticalproductshmcts.dsd.io/
  end

  def dev?
    ENV['SENDING_HOST'] =~ /hmctsformfinderbackoffice-dev.tacticalproductshmcts.dsd.io/
  end
end
