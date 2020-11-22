#sets up a custom file address
APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..', '..'))
$: << File.join(APP_ROOT, 'app/hero_challenge/')

require 'spec_helper'
require 'hero'

describe Hero do
  it 'has a sword' do
    hero = Hero.new
    expect(hero.weapon).to eq('sword')
  end
end
