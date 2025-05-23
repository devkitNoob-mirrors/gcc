/* { dg-require-effective-target arm_v8_2a_fp16_scalar_hw } */
/* { dg-add-options arm_v8_2a_fp16_scalar }  */

#include <arm_fp16.h>

#define INFF __builtin_inf ()

/* Expected results (16-bit hexadecimal representation).  */
uint16_t expected[] =
{
  0x3c00 /* 1.000000 */,
  0x3c00 /* 1.000000 */,
  0x4000 /* 2.000000 */,
  0x5640 /* 100.000000 */,
  0x4f80 /* 30.000000 */,
  0x3666 /* 0.399902 */,
  0x3800 /* 0.500000 */,
  0x3d52 /* 1.330078 */,
  0xc64d /* -6.300781 */,
  0x4d00 /* 20.000000 */,
  0x355d /* 0.335205 */,
  0x409a /* 2.300781 */,
  0x3c00 /* 1.000000 */,
  0x4a91 /* 13.132812 */,
  0x34f6 /* 0.310059 */,
  0x4d00 /* 20.000000 */,
  0x7c00 /* inf */,
  0x7c00 /* inf */
};

#define TEST_MSG "VMAXNMH_F16"
#define INSN_NAME vmaxnmh_f16

#define EXPECTED expected

#define INPUT_TYPE float16_t
#define OUTPUT_TYPE float16_t
#define OUTPUT_TYPE_SIZE 16

/* Include the template for binary scalar operations.  */
#include "binary_scalar_op.inc"
