import 'package:speakup/features/home/data/models/voices.dart';

abstract class VoicesDataSource {
  VoicesModel getVoices();
}

class VoicesDataSourceImpl implements VoicesDataSource {
  @override
  VoicesModel getVoices() {
    return VoicesModel({
      'Rachel': '21m00Tcm4TlvDq8ikWAM',
      'Drew': '29vD33N1CtxCmqQRPOHJ',
      'Clyde': '2EiwWnXFnvU5JabPnv8n',
      'Paul': '5Q0t7uMcjvnagumLfvZi',
      'Domi': 'AZnzlk1XvdvUeBnXmlld',
      'Dave': 'CYw3kZ02Hs0563khs1Fj',
      'Fin': 'D38z5RcWu1voky8WS1ja',
      'Sarah': 'EXAVITQu4vr4xnSDxMaL',
      'Antoni': 'ErXwobaYiN019PkySvjV',
      'Thomas': 'GBv7mTt0atIp3Br8iCZE',
      'Charlie': 'IKne3meq5aSn9XLyUdCD',
      'George': 'JBFqnCBsd6RMkjVDRZzb',
      'Emily': 'LcfcDJNUP1GQjkzn1xUU',
      'Elli': 'MF3mGyEYCl7XYWbV9V6O',
      'Callum': 'N2lVS1w4EtoT3dr4eOWO',
      'Patrick': 'ODq5zmih8GrVes37Dizd',
      'Harry': 'SOYHLrjzK2X1ezoPC6cr',
      'Liam': 'TX3LPaxmHKxFdv7VOQHJ',
      'Dorothy': 'ThT5KcBeYPX3keUQqHPh',
      'Josh': 'TxGEqnHWrfWFTfGW9XjX',
      'Arnold': 'VR6AewLTigWG4xSOukaG',
      'Charlotte': 'XB0fDUnXU5powFXDhCwa',
      'Matilda': 'XrExE9yKIg1WjnnlVkGX',
      'Matthew': 'Yko7PKHZNXotIFUBG7I9',
      'James': 'ZQe5CZNOzWyzPSCn5a3c',
      'Joseph': 'Zlb1dXrM653N07WRdFW3',
      'Jeremy': 'bVMeCyTHy58xNoL34h3p',
      'Michael': 'flq6f7yk4E4fJM5XTYuZ',
      'Ethan': 'g5CIjZEefAph4nQFvHAz',
      'Gigi': 'jBpfuIE2acCO8z3wKNLl',
      'Freya': 'jsCqWAovK2LkecY7zXl4',
      'Santa Claus': 'knrPHWnBmmDHMoiMeP3l',
      'Grace': 'oWAxZDx7w5VEj9dCyTzz',
      'Daniel': 'onwK4e9ZLuTAKqWW03F9',
      'Lily': 'pFZP5JQG7iQjIQuC4Bku',
      'Serena': 'pMsXgVXv3BLzUgSXRplE',
      'Adam': 'pNInz6obpgDQGcFmaJgB',
      'Nicole': 'piTKgcLEGmPE4e6mEKli',
      'Bill': 'pqHfZKP75CvOlQylNhV4',
      'Jessie': 't0jbNlBVZ17f02VDIeMI',
      'Sam': 'yoZ06aMxZJJ28mfd3POQ',
      'Glinda': 'z9fAnlkpzviPz146aGWa',
      'Giovanni': 'zcAOhNBS3c14rBihAFp1',
      'Mimi': 'zrHiDhphv9ZnVXBqCLjz'
    });
  }
}
