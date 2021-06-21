inherited TasCheckCtrl: TTasCheckCtrl
  ClientHeight = 357
  ClientWidth = 715
  Caption = 'TasCheckCtrl'
  ExplicitWidth = 731
  ExplicitHeight = 416
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 293
    Width = 715
    ExplicitTop = 283
    ExplicitWidth = 715
  end
  inherited pnl_fundo: TUniPanel
    Width = 715
    Height = 293
    ExplicitWidth = 715
    ExplicitHeight = 283
    object UniPanel1: TUniPanel
      Left = 2
      Top = 2
      Width = 711
      Height = 87
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsFrameLowered
      Caption = ''
      object UniLabel1: TUniLabel
        Left = 4
        Top = 6
        Width = 33
        Height = 13
        Hint = ''
        Caption = 'C'#243'digo'
        TabOrder = 1
      end
      object E_ID: TUniEdit
        Left = 4
        Top = 20
        Width = 53
        Hint = ''
        Text = ''
        TabOrder = 2
      end
      object Rg_Kind: TUniRadioGroup
        Left = 59
        Top = 4
        Width = 150
        Height = 38
        Hint = ''
        Items.Strings = (
          'Pr'#243'prio'
          'Terceiro')
        Caption = 'Tipo de Cheque'
        TabOrder = 3
        Columns = 2
      end
      object UniLabel2: TUniLabel
        Left = 211
        Top = 6
        Width = 54
        Height = 13
        Hint = ''
        Caption = 'Pr'#233' Datado'
        TabOrder = 4
      end
      object Dtp_check_date: TUniDateTimePicker
        Left = 211
        Top = 20
        Width = 94
        Hint = ''
        DateTime = 42997.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 5
      end
      object UniLabel3: TUniLabel
        Left = 307
        Top = 6
        Width = 42
        Height = 13
        Hint = ''
        Caption = 'Emitente'
        TabOrder = 6
      end
      object E_issuer: TUniEdit
        Left = 307
        Top = 20
        Width = 398
        Hint = ''
        Text = ''
        TabOrder = 7
      end
      object UniLabel4: TUniLabel
        Left = 4
        Top = 45
        Width = 29
        Height = 13
        Hint = ''
        Caption = 'Banco'
        TabOrder = 8
      end
      object E_bank_number: TUniEdit
        Left = 4
        Top = 59
        Width = 37
        Hint = ''
        Text = ''
        TabOrder = 9
      end
      object UniLabel5: TUniLabel
        Left = 43
        Top = 45
        Width = 38
        Height = 13
        Hint = ''
        Caption = 'Ag'#234'ncia'
        TabOrder = 10
      end
      object E_bank_agency: TUniEdit
        Left = 43
        Top = 59
        Width = 49
        Hint = ''
        Text = ''
        TabOrder = 11
      end
      object E_account: TUniEdit
        Left = 94
        Top = 59
        Width = 92
        Hint = ''
        Text = ''
        TabOrder = 12
      end
      object UniLabel6: TUniLabel
        Left = 94
        Top = 45
        Width = 75
        Height = 13
        Hint = ''
        Caption = 'Conta Corrente'
        TabOrder = 13
      end
      object UniLabel7: TUniLabel
        Left = 188
        Top = 45
        Width = 37
        Height = 13
        Hint = ''
        Caption = 'Cheque'
        TabOrder = 14
      end
      object TUniEdit: TUniEdit
        Left = 188
        Top = 59
        Width = 53
        Hint = ''
        Text = ''
        TabOrder = 15
      end
      object UniLabel8: TUniLabel
        Left = 243
        Top = 45
        Width = 24
        Height = 13
        Hint = ''
        Caption = 'Valor'
        TabOrder = 16
      end
      object E_check_value: TUniEdit
        Left = 243
        Top = 59
        Width = 62
        Hint = ''
        Text = ''
        TabOrder = 17
      end
      object UniLabel9: TUniLabel
        Left = 307
        Top = 45
        Width = 47
        Height = 13
        Hint = ''
        Caption = 'Devolvido'
        TabOrder = 18
      end
      object UniEdit8: TUniEdit
        Left = 307
        Top = 59
        Width = 47
        Hint = ''
        Text = ''
        TabOrder = 19
      end
      object UniLabel10: TUniLabel
        Left = 356
        Top = 45
        Width = 81
        Height = 13
        Hint = ''
        Caption = 'Valor Amortizado'
        TabOrder = 20
      end
      object UniEdit9: TUniEdit
        Left = 356
        Top = 59
        Width = 81
        Hint = ''
        Text = ''
        TabOrder = 21
      end
      object UniDateTimePicker2: TUniDateTimePicker
        Left = 439
        Top = 59
        Width = 82
        Hint = ''
        DateTime = 42997.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 22
      end
      object UniLabel11: TUniLabel
        Left = 439
        Top = 45
        Width = 75
        Height = 13
        Hint = ''
        Caption = #218'ltima Quita'#231#227'o'
        TabOrder = 23
      end
      object UniLabel12: TUniLabel
        Left = 523
        Top = 45
        Width = 70
        Height = 13
        Hint = ''
        Caption = 'V'#237'nculo Origem'
        TabOrder = 24
      end
      object UniLabel13: TUniLabel
        Left = 611
        Top = 45
        Width = 72
        Height = 13
        Hint = ''
        Caption = 'V'#237'nculo Destino'
        TabOrder = 25
      end
      object UniEdit10: TUniEdit
        Left = 611
        Top = 59
        Width = 94
        Hint = ''
        Text = ''
        TabOrder = 26
      end
      object UniEdit11: TUniEdit
        Left = 523
        Top = 59
        Width = 86
        Hint = ''
        Text = ''
        TabOrder = 27
      end
    end
    object UniPageControl1: TUniPageControl
      Left = 4
      Top = 89
      Width = 708
      Height = 193
      Hint = ''
      ActivePage = UniTabSheet2
      TabOrder = 2
      object UniTabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'Origem'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object UniPanel2: TUniPanel
          Left = 0
          Top = 0
          Width = 700
          Height = 165
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniDBGrid1: TUniDBGrid
            Left = 2
            Top = 2
            Width = 696
            Height = 161
            Hint = ''
            LoadMask.Message = 'Loading data...'
            Align = alClient
            TabOrder = 1
          end
        end
      end
      object UniTabSheet2: TUniTabSheet
        Hint = ''
        Caption = 'Destino'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object UniPanel3: TUniPanel
          Left = 0
          Top = 0
          Width = 700
          Height = 165
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniDBGrid2: TUniDBGrid
            Left = 2
            Top = 2
            Width = 696
            Height = 161
            Hint = ''
            LoadMask.Message = 'Loading data...'
            Align = alClient
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 48
    Top = 200
  end
end
