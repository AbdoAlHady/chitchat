import 'package:chitchat/core/network/api_constants.dart';
import 'package:chitchat/features/auth/data/models/login_request_body.dart';
import 'package:chitchat/features/auth/data/models/login_response.dart';
import 'package:chitchat/features/auth/data/models/register_request_body.dart';
import 'package:chitchat/features/auth/data/models/message_response.dart';
import 'package:chitchat/features/auth/data/models/resend_email_verification_request_body.dart';
import 'package:chitchat/features/auth/data/models/verify_email_request_body.dart';
import 'package:chitchat/features/messages/data/models/conversation_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.register)
  Future<MessageResponse> register(
    @Body() RegisterRequestBody registerRequestBody,
  );

  @POST(ApiConstants.verifyEmail)
  Future<MessageResponse> verifyEmail(
    @Body() VerifyEmailRequestBody verifyEmailRequestBody,
  );

  @POST(ApiConstants.resendEmailVerificationCode)
  Future<MessageResponse> resendEmailVerificationCode(
    @Body()
    ResendEmailVerificationRequestBody resendEmailVerificationRequestBody,
  );

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @GET(ApiConstants.conversations)
  Future<ConversationResponse> getAllConversations();
}
