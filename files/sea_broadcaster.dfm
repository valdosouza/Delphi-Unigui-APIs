inherited SeaBroadcaster: TSeaBroadcaster
  ClientWidth = 783
  Caption = 'Pesquisa de Ve'#237'culo de Comunica'#231#227'o'
  ExplicitWidth = 799
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 783
    ExplicitWidth = 783
    inherited pc_search: TUniPageControl
      Width = 779
      ExplicitWidth = 779
      inherited tbs_param: TUniTabSheet
        ExplicitWidth = 771
        ExplicitHeight = 444
        inherited pnl_param: TUniPanel
          Width = 771
          ExplicitWidth = 771
          inherited pnl_param_row_1: TUniPanel
            Width = 767
            ExplicitWidth = 767
            inherited pnl_data: TUniPanel
              inherited ChBx_Periodo: TUniCheckBox
                ExplicitTop = 5
              end
            end
            inherited E_Code: TUniEdit
              ExplicitLeft = 219
              ExplicitTop = 3
              ExplicitHeight = 46
            end
            inherited E_Reason: TUniEdit
              ExplicitLeft = 280
              ExplicitTop = 3
              ExplicitHeight = 46
            end
            inherited E_Fantasy: TUniEdit
              Width = 240
              ExplicitLeft = 524
              ExplicitTop = 3
              ExplicitWidth = 240
              ExplicitHeight = 46
            end
          end
          inherited pnl_param_row_2: TUniPanel
            Width = 767
            ExplicitLeft = 2
            ExplicitTop = 54
            ExplicitWidth = 767
            inherited E_Neighborhood: TUniEdit
              ExplicitLeft = 3
              ExplicitTop = 3
              ExplicitHeight = 46
            end
            inherited E_Region: TUniEdit
              ExplicitLeft = 302
              ExplicitTop = 3
              ExplicitHeight = 46
            end
            inherited E_State: TUniEdit
              ExplicitLeft = 491
              ExplicitTop = 3
              ExplicitHeight = 46
            end
            inherited E_City: TUniEdit
              Width = 224
              ExplicitLeft = 540
              ExplicitTop = 3
              ExplicitWidth = 224
              ExplicitHeight = 46
            end
          end
          inherited pnl_param_row_3: TUniPanel
            Width = 767
            ExplicitLeft = 2
            ExplicitTop = 106
            ExplicitWidth = 767
            inherited E_Phone: TUniEdit
              ExplicitLeft = 305
            end
            inherited E_note: TUniEdit
              Width = 358
              ExplicitWidth = 358
            end
            inherited E_Email: TUniEdit
              ExplicitTop = 3
            end
          end
          inherited pnl_param_row_4_1: TUniPanel
            Width = 767
            ExplicitTop = 158
            ExplicitWidth = 767
            inherited E_CNPJ_CPF: TUniEdit
              ExplicitLeft = 3
              ExplicitTop = 3
              ExplicitHeight = 46
            end
            inherited RG_Person: TUniRadioGroup
              ExplicitTop = 3
              ExplicitHeight = 46
            end
          end
        end
        inherited pnl_config: TUniPanel
          Width = 771
          ExplicitWidth = 771
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitWidth = 771
        ExplicitHeight = 444
        inherited dbg_Search: TUniDBGrid
          Width = 771
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 783
    ExplicitWidth = 783
  end
end
