inherited SeaOrderBudgetMedia: TSeaOrderBudgetMedia
  ClientHeight = 437
  ClientWidth = 720
  Caption = 'SeaOrderBudgetMedia'
  ExplicitWidth = 736
  ExplicitHeight = 476
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Top = 81
    Width = 720
    Height = 283
    ExplicitTop = 81
    ExplicitWidth = 720
    ExplicitHeight = 283
    inherited pc_search: TUniPageControl
      Width = 716
      Height = 279
      inherited tbs_search: TUniTabSheet
        inherited dbg_Search: TUniDBGrid
          Width = 708
          Height = 251
          Columns = <>
        end
      end
    end
  end
  inherited Pnl_Parametros: TUniPanel
    Width = 720
    Height = 81
    ExplicitWidth = 720
    ExplicitHeight = 81
    object UniGroupBox1: TUniGroupBox
      Left = 6
      Top = 5
      Width = 707
      Height = 68
      Hint = ''
      Caption = 'Digite sua op'#231#227'o de busca'
      TabOrder = 1
      object UniDateTimePicker1: TUniDateTimePicker
        Left = 7
        Top = 34
        Width = 98
        Hint = ''
        DateTime = 42977.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 1
      end
      object UniDateTimePicker2: TUniDateTimePicker
        Left = 107
        Top = 34
        Width = 102
        Hint = ''
        DateTime = 42977.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 2
      end
      object UniLabel1: TUniLabel
        Left = 7
        Top = 19
        Width = 53
        Height = 13
        Hint = ''
        Caption = 'Data Inicial'
        TabOrder = 3
      end
      object UniLabel2: TUniLabel
        Left = 107
        Top = 19
        Width = 48
        Height = 13
        Hint = ''
        Caption = 'Data Final'
        TabOrder = 4
      end
      object UniLabel3: TUniLabel
        Left = 211
        Top = 19
        Width = 40
        Height = 13
        Hint = ''
        Caption = 'Cota'#231#227'o'
        TabOrder = 5
      end
      object UniEdit1: TUniEdit
        Left = 211
        Top = 34
        Width = 78
        Hint = ''
        Text = ''
        TabOrder = 6
      end
      object UniLabel4: TUniLabel
        Left = 291
        Top = 19
        Width = 148
        Height = 13
        Hint = ''
        Caption = 'Nome Cliente/Ag'#234'ncia/Contato'
        TabOrder = 7
      end
      object UniEdit2: TUniEdit
        Left = 291
        Top = 34
        Width = 331
        Hint = ''
        Text = ''
        TabOrder = 8
      end
      object UniCheckBox1: TUniCheckBox
        Left = 625
        Top = 21
        Width = 80
        Height = 17
        Hint = ''
        Caption = 'Vencidos'
        TabOrder = 9
      end
      object UniCheckBox2: TUniCheckBox
        Left = 625
        Top = 39
        Width = 80
        Height = 17
        Hint = ''
        Caption = 'Arquivados'
        TabOrder = 10
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 364
    Width = 720
    ExplicitTop = 364
    ExplicitWidth = 720
  end
end
