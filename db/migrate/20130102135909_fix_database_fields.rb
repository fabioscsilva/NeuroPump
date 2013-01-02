class FixDatabaseFields < ActiveRecord::Migration
  def change
  	# Remover tabela types e sua associaçã a Logins
  	remove_column :logins, :type_id
  	drop_table :types
  	drop_table :exercises

    # Renomear colunas <- BLOCO APAGADO
    #rename_table :clocks, :clock_results
    #rename_table :wms, :wms_results
    #rename_table :wais, :wais_results
    #rename_table :ftts, :ftts_results
    #rename_table :tmts, :tmts_results

    # Corrigir tipos para float
    change_column :clock_results, :pointers_loc_result, :float

    # Corrigir tipos String -> Text
    change_column :clinical_histories, :description, :text
    change_column :appointments, :description, :text
    change_column :tests, :description, :text
    change_column :clock_results, :observations, :text
    change_column :ftts_results, :observations, :text
    change_column :tmts_results, :observations, :text
    change_column :wais_results, :observations, :text
    change_column :wms_results, :observations, :text
  end
end
