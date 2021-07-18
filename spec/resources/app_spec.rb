# frozen_string_literal: true

require 'spec_helper'

describe 'codenamephp_jetbrains_toolbox_app' do
  platform 'debian' # https://github.com/chefspec/chefspec/issues/953

  step_into :codenamephp_jetbrains_toolbox_app

  context 'Install with minimal properties' do
    recipe do
      codenamephp_jetbrains_toolbox_app 'install toolbox'
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'creates x11 template' do
      allow(File).to receive(:exist?).and_call_original
      allow(File).to receive(:exist?).with('/usr/share/jetbrains-toolbox/app').and_return(true)

      expect(chef_run).to create_directory('/etc/X11/Xsession.d').with(recursive: true, owner: 'root', group: 'root')

      expect(chef_run).to create_template('install jetrbains toolbox run on boot with x11 session').with(
        source: 'autostart/xsession.erb',
        cookbook: 'codenamephp_jetbrains_toolbox',
        path: '/etc/X11/Xsession.d/100-jetbrains-toolbox',
        owner: 'root',
        group: 'root',
        mode: '0777',
        variables: {
          toolbox_path: '/usr/share/jetbrains-toolbox',
        }
      )
    end

    it 'creates xdg template' do
      allow(File).to receive(:exist?).and_call_original
      allow(File).to receive(:exist?).with('/usr/share/jetbrains-toolbox/app').and_return(true)

      expect(chef_run).to create_directory('/etc/xdg/autostart').with(recursive: true, owner: 'root', group: 'root')

      expect(chef_run).to create_template('install jetbrains toolbox run on boot with xdg autostart').with(
        source: 'autostart/xdg.erb',
        cookbook: 'codenamephp_jetbrains_toolbox',
        path: '/etc/xdg/autostart/jetbrains-toolbox.desktop',
        owner: 'root',
        group: 'root',
        mode: '0777',
        variables: {
          toolbox_path: '/usr/share/jetbrains-toolbox',
        }
      )
    end
  end

  context 'Uninstall with minimal properties' do
    recipe do
      codenamephp_jetbrains_toolbox_app 'install toolbox' do
        action :uninstall
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'deletes xdg script' do
      expect(chef_run).to delete_file('delete xdb script').with(
        path: '/etc/xdg/autostart/jetbrains-toolbox.desktop'
      )
    end
  end
end
