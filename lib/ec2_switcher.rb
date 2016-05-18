require "ec2_switcher/version"
require "aws-sdk"

class Switcher

  attr_accessor :ec2
  attr_accessor :aws
  attr_accessor :region
  attr_accessor :credentials

  def initialize(id)
    binding.pry
    @region = set_region
    @credentials = set_credentials
    @aws = aws_connection
    @ec2 = ec2_client_connect(id)
    puts 'connected to ec2 server' if @ec2
  end

  def ec2_client_connect(id)
    @id ||= id
    Aws::EC2::Instance.new(credentials: @credentials, id: id)
  end

  def reload
    @ec2 = self.ec2_client_connect(@id)
  end

  def running?
    self.reload
    @ec2.state.to_s.include?("name=\"running\"")
  end

  def off
    @ec2.stop
    puts 'instance stopping'
    self.reload
  end

  def on
    @ec2.start
    puts 'instance starting'
    self.reload
  end

  def auto
    self.running? ? self.off : self.on
  end

  private

  def constants_not_defined?
    defined?(EC2_AMAZON_ACCESS_KEY).nil? || defined?(EC2_AMAZON_SECRET_ACCESS).nil?
  end

  def set_region
    defined?(EC2_AMAZON_REGION).nil? ? EC2_AMAZON_REGION : 'eu-west-1'
  end

  def set_credentials
    if constants_not_defined?
      puts 'profile connection'
      Aws::SharedCredentials.new(profile_name: 'ec2')
    else
      puts 'global variables connection'
      Aws::Credentials.new(EC2_AMAZON_ACCESS_KEY, EC2_AMAZON_SECRET_ACCESS)
    end
  end

  def aws_connection
    Aws.config.update({
      region: @region,
      credentials: @credentials
    })
  end

end