# frozen_string_literal: true

require 'spec_helper'
require "rails/generators"
require "generators/phlex/view/view_generator"
require "generators/phlex/install/install_generator"
require "generators/phlex/component/component_generator"

RSpec.describe 'Phlex generators' do
  def with_temp_dir
    path = Pathname("./tmp/generators/#{SecureRandom.uuid}")
    FileUtils.mkdir_p(path)
    yield path
  ensure
    FileUtils.rm_rf(path)
  end

  def capture_io
    orig_stdout = $stdout
    orig_stderr = $stderr
    captured_stdout = StringIO.new
    captured_stderr = StringIO.new
    $stdout = captured_stdout
    $stderr = captured_stderr

    yield

    [captured_stdout.string, captured_stderr.string]
  ensure
    $stdout = orig_stdout
    $stderr = orig_stderr
  end

  it 'runs install generator' do
    with_temp_dir do |path|
      generator = Phlex::Generators::InstallGenerator.new
      generator.destination_root = path
      stdout, stderr = capture_io { generator.invoke_all }

      expect(File).to exist("#{path}/config/initializers/phlex.rb")
      expect(File).to exist("#{path}/app/components/base.rb")
      expect(File).to exist("#{path}/app/views/base.rb")
    end
  end

  it 'runs view generator' do
    with_temp_dir do |path|
      generator = Phlex::Generators::ViewGenerator.new(["Articles::Index"])
      generator.destination_root = path
      capture_io { generator.invoke_all }

      expect(File).to exist("#{path}/app/views/articles/index.rb")
    end
  end

  it 'runs component generator' do
    with_temp_dir do |path|
      generator = Phlex::Generators::ComponentGenerator.new(["Card"])
      generator.destination_root = path
      capture_io { generator.invoke_all }

      expect(File).to exist("#{path}/app/components/card.rb")
    end
  end
end 