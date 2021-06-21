inherited TasExtOperatingTest: TTasExtOperatingTest
  ClientHeight = 390
  ClientWidth = 783
  Caption = 'TasExtOperatingTest'
  ExplicitWidth = 799
  ExplicitHeight = 449
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 326
    Width = 783
    ExplicitTop = 326
    ExplicitWidth = 783
  end
  inherited pnl_fundo: TUniPanel
    Width = 783
    Height = 326
    ExplicitWidth = 783
    ExplicitHeight = 326
    object UniPanel1: TUniPanel
      Left = 2
      Top = 2
      Width = 779
      Height = 126
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsFrameLowered
      Caption = ''
      object UniLabel1: TUniLabel
        Left = 4
        Top = 4
        Width = 37
        Height = 13
        Hint = ''
        Caption = 'N'#250'mero'
        TabOrder = 1
      end
      object UniEdit1: TUniEdit
        Left = 4
        Top = 19
        Width = 61
        Hint = ''
        Text = ''
        TabOrder = 2
      end
      object UniLabel2: TUniLabel
        Left = 67
        Top = 4
        Width = 23
        Height = 13
        Hint = ''
        Caption = 'Data'
        TabOrder = 3
      end
      object UniDateTimePicker1: TUniDateTimePicker
        Left = 67
        Top = 19
        Width = 86
        Hint = ''
        DateTime = 43004.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 4
      end
      object UniLabel3: TUniLabel
        Left = 155
        Top = 4
        Width = 23
        Height = 13
        Hint = ''
        Caption = 'Hora'
        TabOrder = 5
      end
      object UniEdit2: TUniEdit
        Left = 155
        Top = 19
        Width = 46
        Hint = ''
        Text = ''
        TabOrder = 6
      end
      object Ctn_Ext_Agent: TUniContainerPanel
        Left = 204
        Top = 3
        Width = 209
        Height = 38
        Hint = ''
        ParentColor = False
        TabOrder = 7
      end
      object Ctn_Collaborator: TUniContainerPanel
        Left = 415
        Top = 3
        Width = 209
        Height = 38
        Hint = ''
        ParentColor = False
        TabOrder = 8
      end
      object UniLabel4: TUniLabel
        Left = 627
        Top = 4
        Width = 128
        Height = 13
        Hint = ''
        Caption = 'Respons'#225'vel pela Empresa'
        TabOrder = 9
      end
      object UniEdit3: TUniEdit
        Left = 626
        Top = 19
        Width = 147
        Hint = ''
        Text = ''
        TabOrder = 10
      end
      object UniMemo1: TUniMemo
        Left = 4
        Top = 56
        Width = 487
        Height = 65
        Hint = ''
        Lines.Strings = (
          'UniMemo1')
        TabOrder = 11
      end
      object UniRadioGroup1: TUniRadioGroup
        Left = 494
        Top = 75
        Width = 219
        Height = 46
        Hint = ''
        Items.Strings = (
          'Sim'
          'N'#227'o'
          'Avalia'#231#227'o')
        Caption = 'Aprovado'
        TabOrder = 12
        Columns = 3
      end
      object UniLabel5: TUniLabel
        Left = 4
        Top = 43
        Width = 58
        Height = 13
        Hint = ''
        Caption = 'Observa'#231#227'o'
        TabOrder = 13
      end
    end
    object UniPageControl1: TUniPageControl
      Left = 3
      Top = 128
      Width = 778
      Height = 193
      Hint = ''
      ActivePage = UniTabSheet2
      TabOrder = 2
      object UniTabSheet1: TUniTabSheet
        Hint = ''
        Caption = '1 - PROVA'
        object UniPanel2: TUniPanel
          Left = 0
          Top = 0
          Width = 770
          Height = 165
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniLabel6: TUniLabel
            Left = 4
            Top = 4
            Width = 100
            Height = 13
            Hint = ''
            Caption = 'C'#243'digo/Nome Cliente'
            TabOrder = 1
          end
          object UniEdit4: TUniEdit
            Left = 4
            Top = 19
            Width = 129
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object Ctn_Entity_1: TUniContainerPanel
            Left = 135
            Top = 3
            Width = 345
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 3
          end
          object UniLabel7: TUniLabel
            Left = 484
            Top = 4
            Width = 75
            Height = 13
            Hint = ''
            Caption = 'N'#250'mero do Selo'
            TabOrder = 4
          end
          object UniEdit5: TUniEdit
            Left = 484
            Top = 19
            Width = 158
            Hint = ''
            Text = ''
            TabOrder = 5
          end
          object UniRadioGroup2: TUniRadioGroup
            Left = 645
            Top = 1
            Width = 117
            Height = 63
            Hint = ''
            Items.Strings = (
              'Direta'
              'Indireta')
            Caption = 'Pressuriza'#231#227'o'
            TabOrder = 6
          end
          object UniLabel8: TUniLabel
            Left = 4
            Top = 44
            Width = 50
            Height = 13
            Hint = ''
            Caption = 'Recipiente'
            TabOrder = 7
          end
          object E_Rec_Number_1: TUniEdit
            Left = 4
            Top = 59
            Width = 82
            Hint = ''
            Text = ''
            TabOrder = 8
          end
          object UniLabel9: TUniLabel
            Left = 88
            Top = 44
            Width = 44
            Height = 13
            Hint = ''
            Caption = 'Ano Fab.'
            TabOrder = 9
          end
          object E_Rec_Year_1: TUniEdit
            Left = 88
            Top = 59
            Width = 54
            Hint = ''
            Text = ''
            TabOrder = 10
          end
          object Ctn_Rec_Brand_1: TUniContainerPanel
            Left = 144
            Top = 47
            Width = 209
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 11
          end
          object UniLabel10: TUniLabel
            Left = 356
            Top = 44
            Width = 69
            Height = 13
            Hint = ''
            Caption = 'Carga Nominal'
            TabOrder = 12
          end
          object E_Rec_Capacity_1: TUniEdit
            Left = 356
            Top = 59
            Width = 69
            Hint = ''
            Text = ''
            TabOrder = 13
          end
          object Ctn_Rec_Measure_1: TUniContainerPanel
            Left = 427
            Top = 47
            Width = 215
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 14
          end
          object UniLabel11: TUniLabel
            Left = 4
            Top = 83
            Width = 35
            Height = 13
            Hint = ''
            Caption = 'Ampola'
            TabOrder = 15
          end
          object E_Amp_Number_1: TUniEdit
            Left = 4
            Top = 98
            Width = 81
            Hint = ''
            Text = ''
            TabOrder = 16
          end
          object UniLabel12: TUniLabel
            Left = 88
            Top = 83
            Width = 44
            Height = 13
            Hint = ''
            Caption = 'Ano Fab.'
            TabOrder = 17
          end
          object E_Amp_Year_1: TUniEdit
            Left = 88
            Top = 98
            Width = 54
            Hint = ''
            Text = ''
            TabOrder = 18
          end
          object Ctn_Amp_Brand_1: TUniContainerPanel
            Left = 144
            Top = 86
            Width = 209
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 19
          end
          object UniLabel13: TUniLabel
            Left = 356
            Top = 83
            Width = 69
            Height = 13
            Hint = ''
            Caption = 'Carga Nominal'
            TabOrder = 20
          end
          object E_Amp_Capacity_1: TUniEdit
            Left = 356
            Top = 98
            Width = 69
            Hint = ''
            Text = ''
            TabOrder = 21
          end
          object Ctn_Amp_Measure_1: TUniContainerPanel
            Left = 427
            Top = 86
            Width = 215
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 22
          end
          object UniRadioGroup3: TUniRadioGroup
            Left = 645
            Top = 64
            Width = 117
            Height = 61
            Hint = ''
            Items.Strings = (
              'Aprovado'
              'Reprovado')
            Caption = 'Situa'#231#227'o'
            TabOrder = 23
          end
          object UniLabel14: TUniLabel
            Left = 4
            Top = 121
            Width = 23
            Height = 13
            Hint = ''
            Caption = 'Nota'
            TabOrder = 24
          end
          object UniEdit12: TUniEdit
            Left = 4
            Top = 135
            Width = 758
            Hint = ''
            Text = ''
            TabOrder = 25
          end
        end
      end
      object UniTabSheet2: TUniTabSheet
        Hint = ''
        Caption = '2 - CONTRAPROVA'
        object UniPanel3: TUniPanel
          Left = 0
          Top = 0
          Width = 770
          Height = 165
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniLabel15: TUniLabel
            Left = 4
            Top = 4
            Width = 100
            Height = 13
            Hint = ''
            Caption = 'C'#243'digo/Nome Cliente'
            TabOrder = 1
          end
          object UniEdit13: TUniEdit
            Left = 4
            Top = 19
            Width = 129
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object Ctn_Entity_2: TUniContainerPanel
            Left = 135
            Top = 3
            Width = 345
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 3
          end
          object UniLabel16: TUniLabel
            Left = 484
            Top = 4
            Width = 75
            Height = 13
            Hint = ''
            Caption = 'N'#250'mero do Selo'
            TabOrder = 4
          end
          object UniEdit14: TUniEdit
            Left = 484
            Top = 19
            Width = 158
            Hint = ''
            Text = ''
            TabOrder = 5
          end
          object UniRadioGroup4: TUniRadioGroup
            Left = 645
            Top = 1
            Width = 117
            Height = 63
            Hint = ''
            Items.Strings = (
              'Direta'
              'Indireta')
            Caption = 'Pressuriza'#231#227'o'
            TabOrder = 6
          end
          object UniLabel17: TUniLabel
            Left = 4
            Top = 44
            Width = 50
            Height = 13
            Hint = ''
            Caption = 'Recipiente'
            TabOrder = 7
          end
          object E_Rec_Number_2: TUniEdit
            Left = 4
            Top = 59
            Width = 82
            Hint = ''
            Text = ''
            TabOrder = 8
          end
          object UniLabel18: TUniLabel
            Left = 88
            Top = 44
            Width = 44
            Height = 13
            Hint = ''
            Caption = 'Ano Fab.'
            TabOrder = 9
          end
          object E_Rec_Year_2: TUniEdit
            Left = 88
            Top = 59
            Width = 54
            Hint = ''
            Text = ''
            TabOrder = 10
          end
          object Ctn_Rec_Brand_2: TUniContainerPanel
            Left = 144
            Top = 47
            Width = 209
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 11
          end
          object UniLabel19: TUniLabel
            Left = 356
            Top = 44
            Width = 69
            Height = 13
            Hint = ''
            Caption = 'Carga Nominal'
            TabOrder = 12
          end
          object E_Rec_Capacity: TUniEdit
            Left = 356
            Top = 59
            Width = 69
            Hint = ''
            Text = ''
            TabOrder = 13
          end
          object Ctn_Rec_Measure_2: TUniContainerPanel
            Left = 427
            Top = 47
            Width = 215
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 14
          end
          object UniLabel20: TUniLabel
            Left = 4
            Top = 83
            Width = 35
            Height = 13
            Hint = ''
            Caption = 'Ampola'
            TabOrder = 15
          end
          object E_Amp_Number_2: TUniEdit
            Left = 4
            Top = 98
            Width = 81
            Hint = ''
            Text = ''
            TabOrder = 16
          end
          object UniLabel21: TUniLabel
            Left = 88
            Top = 83
            Width = 44
            Height = 13
            Hint = ''
            Caption = 'Ano Fab.'
            TabOrder = 17
          end
          object E_Amp_Year_2: TUniEdit
            Left = 88
            Top = 98
            Width = 54
            Hint = ''
            Text = ''
            TabOrder = 18
          end
          object Ctn_Amp_Brand_2: TUniContainerPanel
            Left = 144
            Top = 87
            Width = 209
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 19
          end
          object UniLabel22: TUniLabel
            Left = 356
            Top = 83
            Width = 69
            Height = 13
            Hint = ''
            Caption = 'Carga Nominal'
            TabOrder = 20
          end
          object E_Amp_Capacity_2: TUniEdit
            Left = 356
            Top = 98
            Width = 69
            Hint = ''
            Text = ''
            TabOrder = 21
          end
          object Ctn_Amp_Measure_2: TUniContainerPanel
            Left = 427
            Top = 86
            Width = 215
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 22
          end
          object UniRadioGroup5: TUniRadioGroup
            Left = 645
            Top = 64
            Width = 117
            Height = 61
            Hint = ''
            Items.Strings = (
              'Aprovado'
              'Reprovado')
            Caption = 'Situa'#231#227'o'
            TabOrder = 23
          end
          object UniLabel23: TUniLabel
            Left = 4
            Top = 121
            Width = 23
            Height = 13
            Hint = ''
            Caption = 'Nota'
            TabOrder = 24
          end
          object UniEdit21: TUniEdit
            Left = 4
            Top = 135
            Width = 758
            Hint = ''
            Text = ''
            TabOrder = 25
          end
        end
      end
      object UniTabSheet3: TUniTabSheet
        Hint = ''
        Caption = '3 - TESTEMUNHA'
        object UniPanel4: TUniPanel
          Left = 0
          Top = 0
          Width = 770
          Height = 165
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniLabel24: TUniLabel
            Left = 4
            Top = 4
            Width = 100
            Height = 13
            Hint = ''
            Caption = 'C'#243'digo/Nome Cliente'
            TabOrder = 1
          end
          object UniEdit22: TUniEdit
            Left = 4
            Top = 19
            Width = 129
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object Ctn_Entity_3: TUniContainerPanel
            Left = 135
            Top = 3
            Width = 345
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 3
          end
          object UniLabel25: TUniLabel
            Left = 484
            Top = 4
            Width = 75
            Height = 13
            Hint = ''
            Caption = 'N'#250'mero do Selo'
            TabOrder = 4
          end
          object UniEdit23: TUniEdit
            Left = 484
            Top = 19
            Width = 158
            Hint = ''
            Text = ''
            TabOrder = 5
          end
          object UniRadioGroup6: TUniRadioGroup
            Left = 645
            Top = 1
            Width = 117
            Height = 63
            Hint = ''
            Items.Strings = (
              'Direta'
              'Indireta')
            Caption = 'Pressuriza'#231#227'o'
            TabOrder = 6
          end
          object UniLabel26: TUniLabel
            Left = 4
            Top = 44
            Width = 50
            Height = 13
            Hint = ''
            Caption = 'Recipiente'
            TabOrder = 7
          end
          object E_Rec_Number_3: TUniEdit
            Left = 4
            Top = 59
            Width = 82
            Hint = ''
            Text = ''
            TabOrder = 8
          end
          object UniLabel27: TUniLabel
            Left = 88
            Top = 44
            Width = 44
            Height = 13
            Hint = ''
            Caption = 'Ano Fab.'
            TabOrder = 9
          end
          object E_Rec_Year_3: TUniEdit
            Left = 88
            Top = 59
            Width = 54
            Hint = ''
            Text = ''
            TabOrder = 10
          end
          object Ctn_Rec_Brand_3: TUniContainerPanel
            Left = 144
            Top = 47
            Width = 209
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 11
          end
          object UniLabel28: TUniLabel
            Left = 356
            Top = 44
            Width = 69
            Height = 13
            Hint = ''
            Caption = 'Carga Nominal'
            TabOrder = 12
          end
          object E_Rec_Capacity_3: TUniEdit
            Left = 356
            Top = 59
            Width = 69
            Hint = ''
            Text = ''
            TabOrder = 13
          end
          object Ctn_Rec_Measure_3: TUniContainerPanel
            Left = 427
            Top = 47
            Width = 215
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 14
          end
          object UniLabel29: TUniLabel
            Left = 4
            Top = 83
            Width = 35
            Height = 13
            Hint = ''
            Caption = 'Ampola'
            TabOrder = 15
          end
          object E_Amp_Number_3: TUniEdit
            Left = 4
            Top = 98
            Width = 81
            Hint = ''
            Text = ''
            TabOrder = 16
          end
          object UniLabel30: TUniLabel
            Left = 88
            Top = 83
            Width = 44
            Height = 13
            Hint = ''
            Caption = 'Ano Fab.'
            TabOrder = 17
          end
          object E_Amp_Year_3: TUniEdit
            Left = 88
            Top = 98
            Width = 54
            Hint = ''
            Text = ''
            TabOrder = 18
          end
          object Ctn_Amp_Brand_3: TUniContainerPanel
            Left = 144
            Top = 86
            Width = 209
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 19
          end
          object UniLabel31: TUniLabel
            Left = 356
            Top = 83
            Width = 69
            Height = 13
            Hint = ''
            Caption = 'Carga Nominal'
            TabOrder = 20
          end
          object E_Amp_Capacity_3: TUniEdit
            Left = 356
            Top = 98
            Width = 69
            Hint = ''
            Text = ''
            TabOrder = 21
          end
          object Ctn_Amp_Measure_3: TUniContainerPanel
            Left = 427
            Top = 86
            Width = 215
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 22
          end
          object UniRadioGroup7: TUniRadioGroup
            Left = 645
            Top = 64
            Width = 117
            Height = 61
            Hint = ''
            Items.Strings = (
              'Aprovado'
              'Reprovado')
            Caption = 'Situa'#231#227'o'
            TabOrder = 23
          end
          object UniLabel32: TUniLabel
            Left = 4
            Top = 121
            Width = 23
            Height = 13
            Hint = ''
            Caption = 'Nota'
            TabOrder = 24
          end
          object UniEdit30: TUniEdit
            Left = 4
            Top = 135
            Width = 758
            Hint = ''
            Text = ''
            TabOrder = 25
          end
        end
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 592
    Top = 424
  end
end
