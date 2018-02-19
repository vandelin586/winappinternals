require 'spec_helper'

describe 'winappinternals' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "winappinternals class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('winappinternals::params') }
          it { is_expected.to contain_class('winappinternals::install').that_comes_before('winappinternals::config') }
          it { is_expected.to contain_class('winappinternals::config') }
          it { is_expected.to contain_class('winappinternals::service').that_subscribes_to('winappinternals::config') }

          it { is_expected.to contain_service('winappinternals') }
          it { is_expected.to contain_package('winappinternals').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'winappinternals class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('winappinternals') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
