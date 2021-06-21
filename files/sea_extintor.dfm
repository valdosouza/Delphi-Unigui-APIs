inherited SeaExtintor: TSeaExtintor
  ClientWidth = 887
  Caption = 'Pesquisa Extintor'
  ExplicitWidth = 903
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 887
    ExplicitWidth = 887
    ExplicitHeight = 335
    inherited pc_search: TUniPageControl
      Width = 883
      ExplicitWidth = 883
      ExplicitHeight = 331
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 875
        ExplicitHeight = 303
        inherited pnl_param: TUniPanel
          Width = 875
          ExplicitWidth = 875
          ExplicitHeight = 303
          object UniLabel1: TUniLabel
            Left = 4
            Top = 16
            Width = 55
            Height = 13
            Hint = ''
            Caption = 'C'#243'd Cliente'
            TabOrder = 1
          end
          object UniEdit1: TUniEdit
            Left = 4
            Top = 31
            Width = 57
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object Ctn_Entity: TUniContainerPanel
            Left = 69
            Top = 18
            Width = 343
            Height = 35
            Hint = ''
            ParentColor = False
            TabOrder = 3
          end
          object UniLabel2: TUniLabel
            Left = 415
            Top = 16
            Width = 89
            Height = 13
            Hint = ''
            Caption = 'N'#250'mero Sequ'#234'ncia'
            TabOrder = 4
          end
          object UniEdit2: TUniEdit
            Left = 415
            Top = 31
            Width = 89
            Hint = ''
            Text = ''
            TabOrder = 5
          end
          object UniLabel3: TUniLabel
            Left = 506
            Top = 16
            Width = 75
            Height = 13
            Hint = ''
            Caption = 'N'#250'mero de Selo'
            TabOrder = 6
          end
          object UniEdit3: TUniEdit
            Left = 506
            Top = 31
            Width = 75
            Hint = ''
            Text = ''
            TabOrder = 7
          end
          object UniLabel4: TUniLabel
            Left = 583
            Top = 16
            Width = 85
            Height = 13
            Hint = ''
            Caption = 'Marca do Extintor'
            TabOrder = 8
          end
          object UniEdit4: TUniEdit
            Left = 583
            Top = 31
            Width = 89
            Hint = ''
            Text = ''
            TabOrder = 9
          end
          object UniLabel5: TUniLabel
            Left = 674
            Top = 16
            Width = 51
            Height = 13
            Hint = ''
            Caption = 'Lote de P'#243
            TabOrder = 10
          end
          object UniEdit5: TUniEdit
            Left = 674
            Top = 31
            Width = 71
            Hint = ''
            Text = ''
            TabOrder = 11
          end
          object UniLabel6: TUniLabel
            Left = 747
            Top = 16
            Width = 20
            Height = 13
            Hint = ''
            Caption = 'Tipo'
            TabOrder = 12
          end
          object UniEdit6: TUniEdit
            Left = 747
            Top = 31
            Width = 60
            Hint = ''
            Text = ''
            TabOrder = 13
          end
          object UniLabel7: TUniLabel
            Left = 809
            Top = 16
            Width = 56
            Height = 13
            Hint = ''
            Caption = 'Capacidade'
            TabOrder = 14
          end
          object UniEdit7: TUniEdit
            Left = 809
            Top = 31
            Width = 66
            Hint = ''
            Text = ''
            TabOrder = 15
          end
          object Ctn_Situation: TUniContainerPanel
            Left = 4
            Top = 55
            Width = 283
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 16
          end
          object UniLabel8: TUniLabel
            Left = 291
            Top = 59
            Width = 68
            Height = 13
            Hint = ''
            Caption = 'Ano do Ensaio'
            TabOrder = 17
          end
          object UniEdit8: TUniEdit
            Left = 291
            Top = 71
            Width = 84
            Hint = ''
            Text = ''
            TabOrder = 18
          end
          object ChBx_Periodo: TUniCheckBox
            Left = 378
            Top = 57
            Width = 145
            Height = 13
            Hint = ''
            Checked = True
            Caption = 'Periodo data de cadastro'
            TabOrder = 19
          end
          object DTP_Date_Initial: TUniDateTimePicker
            Left = 377
            Top = 71
            Width = 97
            Hint = ''
            DateTime = 42544.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 20
          end
          object DTP_Date_End: TUniDateTimePicker
            Left = 476
            Top = 71
            Width = 98
            Hint = ''
            DateTime = 42544.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 21
          end
          object UniCheckBox1: TUniCheckBox
            Left = 579
            Top = 55
            Width = 126
            Height = 17
            Hint = ''
            Caption = 'Extintores Inativos'
            TabOrder = 22
          end
          object UniCheckBox2: TUniCheckBox
            Left = 579
            Top = 72
            Width = 228
            Height = 17
            Hint = ''
            Caption = 'Mostrar somente os extintores novos'
            TabOrder = 23
          end
          object UniCheckBox3: TUniCheckBox
            Left = 579
            Top = 89
            Width = 278
            Height = 17
            Hint = ''
            Caption = 'Mostrar apenas o '#250'ltimo resgistro de cada extintor'
            TabOrder = 24
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 875
        ExplicitHeight = 303
        inherited dbg_Search: TUniDBGrid
          Width = 875
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 887
    ExplicitTop = 335
    ExplicitWidth = 887
  end
end
