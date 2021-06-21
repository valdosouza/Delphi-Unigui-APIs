inherited SeaOrderSaleSalesman: TSeaOrderSaleSalesman
  Caption = 'Pesquisa Ordem de Venda para Vendedores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    inherited pc_search: TUniPageControl
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 822
        ExplicitHeight = 303
        inherited pnl_param: TUniPanel
          object chbx_periodo: TUniCheckBox
            Left = 6
            Top = 2
            Width = 205
            Height = 17
            Hint = ''
            Checked = True
            Caption = 'Data Inicial            Data Final'
            TabOrder = 1
          end
          object DTP_Date_Initial: TUniDateTimePicker
            Left = 7
            Top = 20
            Width = 100
            Hint = ''
            DateTime = 42916.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 2
          end
          object DTP_Date_End: TUniDateTimePicker
            Left = 111
            Top = 20
            Width = 100
            Hint = ''
            DateTime = 42916.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 3
          end
          object E_Number: TUniEdit
            Left = 214
            Top = 20
            Width = 102
            Hint = ''
            Text = ''
            TabOrder = 4
          end
          object L_Codigo: TUniLabel
            Left = 215
            Top = 4
            Width = 32
            Height = 14
            Hint = ''
            Caption = 'Ordem'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 5
          end
          object Ctn_salesMan: TUniContainerPanel
            Left = 215
            Top = 12
            Width = 607
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 6
          end
        end
      end
    end
  end
end
