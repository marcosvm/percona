class Chef
  class Provider
    class Mysql2ChefGem
      # Provider to install MySQL2 gem on systems using Percona databases
      class Percona < Chef::Provider::LWRPBase
        action :install do
          converge_by 'install mysql2 chef_gem and dependencies' do
            recipe_eval do
              run_context.include_recipe 'build-essential'
              run_context.include_recipe 'percona::client'
            end

            chef_gem 'mysql2' do
              action :install
            end
          end
        end

        action :remove do
          chef_gem 'mysql2' do
            action :remove
          end
        end
      end
    end
  end
end
